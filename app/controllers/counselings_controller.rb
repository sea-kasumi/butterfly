class CounselingsController < ApplicationController
    before_action :set_counsel, only: [:show, :edit, :update, :destroy]

  def index
    @counsels = Counsel.all
    @today = Date.today
  end

  def new
    @counsel = Counsel.find(params[:counsel_id])
    @counseling = Counseling.new
    @hours = Hour.where('start_time >= ?', @counsel.start_time).where('end_time <= ?', @counsel.end_time)
  end

  def create
    @counseling = Counseling.new(counseling_params)
    @repeat = Counseling.where('counsel_id = ?', @counseling.counsel.id).where('hour_id = ?', @counseling.hour.id)
    @counsel = Counsel.find(@counseling.counsel_id)
    @hours = Hour.where('start_time >= ?', @counsel.start_time).where('end_time <= ?', @counsel.end_time)

    if @repeat.count != 0
      respond_to do |format|
        @counseling.errors.add(:base, "この日時はすでに申し込まれています。他の日時を選択してください。")
        @counsel = Counsel.find(@counseling.counsel_id)
        format.html { render :new }
        format.json { render json: @counseling.errors, status: :unprocessable_entity }
      end
      return
    end

    if @counseling.save
      redirect_to (counselings_path) and return
    end
    respond_to do |format|
      @counsel = Counsel.find(@counseling.counsel_id)
      format.html { render :new }
      format.json { render json: @counseling.errors, status: :unprocessable_entity }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def counseling_params
      params.require(:counseling).permit(:hour_id, :user_id, :counsel_id)
    end

end
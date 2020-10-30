class CounselingsController < ApplicationController
    before_action :set_counsel, only: [:show, :edit, :update, :destroy]

  def index
    @counsels = Counsel.all
  end

  def new
    @counsel = Counsel.find_by params[:counsel]
    @counseling = Counseling.new
  end


  private
    # Only allow a list of trusted parameters through.
    def counsel_params
      params.require(:counsel).permit(:day, :start_time, :end_time, :teacher)
    end

end
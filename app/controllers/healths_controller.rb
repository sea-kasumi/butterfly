class HealthsController < ApplicationController
  before_action :set_health, only: [:show, :edit, :update, :destroy]

  # GET /healths
  # GET /healths.json
  def index
    @userclasss = [[1,1],[1,2],[1,3],[1,4],[2,1],[2,2],[2,3],[2,4],[3,1],[3,2],[3,3],[3,4]]
    @healths = Health.where.not(symptom_id: 58)
    @today = Date.today
    @healthdays = Health.select(:day).distinct.order(:day)
    
    @userclasss.each do |userclass|
      @absenceusers = []
      @absenceclass = []
      userclass << []
      userclass << []
      @absence = []
      users = User.all
      @healthdays.each do |healthday|
        @absencecount = 0
        @absenceclasscount = 0
        if healthday.day.wday != 0 or healthday.day.wday != 6
          @absenceusers = []
          @absenceclass = []
          users.each do |user|
            if user.teacher == FALSE and Health.where(day: healthday.day).where(user_id: user.id).empty? then
              @absenceusers << user
              @absencecount = @absencecount + 1
            end
          end
          @absenceusers.each do |absenceuser|
            if absenceuser.grade == userclass[0] and absenceuser.room == userclass[1]
              userclass[2] = absenceuser
              @absenceclasscount = @absenceclasscount + 1
              userclass[3] << [healthday.day, @absenceclasscount]
            end
          end
          @absence << [healthday.day, @absencecount]
        end
      end
  
      @symptoms = []
      userclass << []
      userclass << []
      @healths.each do |health|
        @symptoms << health
        @symptomcount = Health.where.not(symptom_id: 58).group(:day).count
        if health.user.grade == userclass[0] and health.user.room == userclass[1]
          userclass[4] = health
          userclass[5] = Health.where.not(symptom_id: 58).group(:day).count
        end
      end
    end
  end

  # GET /healths/1
  # GET /healths/1.json
  def show
  end

  # GET /healths/new
  def new
    @health = Health.new
    @date = Date.today
  end

  # GET /healths/1/edit
  def edit
  end

  # POST /healths
  # POST /healths.json
  def create
    @health = Health.new(health_params)
    @health.user_id = current_user.id

    respond_to do |format|
      if @health.save
        format.html { redirect_to @health}
        format.json { render :show, status: :created, location: @health }
      else
        format.html { render :new }
        format.json { render json: @health.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /healths/1
  # PATCH/PUT /healths/1.json
  def update
    respond_to do |format|
      if @health.update(health_params)
        format.html { redirect_to @health }
        format.json { render :show, status: :ok, location: @health }
      else
        format.html { render :edit }
        format.json { render json: @health.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /healths/1
  # DELETE /healths/1.json
  def destroy
    @health.destroy
    respond_to do |format|
      format.html { redirect_to healths_url, notice: 'Health was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_health
      @health = Health.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def health_params
      params.require(:health).permit(:user_id, :temperature, :condition, :symptom_id, :day)
    end
end

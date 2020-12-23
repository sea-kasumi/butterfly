class HealthsController < ApplicationController
  before_action :set_health, only: [:show, :edit, :update, :destroy]

  # GET /healths
  # GET /healths.json
  def index
    @userclasss = [[1,1],[1,2],[1,3],[1,4],[2,1],[2,2],[2,3],[2,4],[3,1],[3,2],[3,3],[3,4]]
    @healths = Health.all
    @today = Date.today
    
    @userclasss.each do |userclass|
      @absenceusers = []
      @absenceclass = []
      userclass << []
      userclass << []
      @absence = []
      users = User.all
      (Date.parse("2020-11-01")..Date.parse("2020-12-31")).each do |date|
        @absencecount = 0
        @absenceclasscount = 0
        if date.wday != 0 or date.wday != 6
          if Health.where(day: date).present?
            @absenceusers = []
            @absenceclass = []
            users.each do |user|
              if user.teacher == FALSE and Health.where(user_id: user.id).empty? then
                @absenceusers << user
                @absencecount = @absencecount + 1
                @absenceusers.each do |absenceuser|
                  if absenceuser.grade == userclass[0] and absenceuser.room == userclass[1]
                    userclass[2] = user
                    @absenceclasscount = @absenceclasscount + 1
                    userclass[3] << [date, @absenceclasscount]
                  end
                end
              end
            end
            @absence << [date, @absencecount]
          end
        end
      end
    end
  
    @userclasss.each do |userclass|
      @symptoms = []
      userclass << []
      userclass << []
      @healths.each do |health|
        if health.symptom.disporder > 1
          @symptoms << health
          @symptomcount = Health.where.not(symptom_id: 58).group(:day).count
          if health.user.grade == userclass[0] and health.user.room == userclass[1]
            userclass[4] = health
            userclass[5] = Health.where.not(symptom_id: 58).group(:day).count
          end
        end
      end
    end
    @healths = Health.all
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
        format.html { redirect_to @health, notice: 'Health was successfully created.' }
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
        format.html { redirect_to @health, notice: 'Health was successfully updated.' }
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

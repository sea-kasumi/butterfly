class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.left_joins(:answers).group(:id).select("questions.*, count(answers.id) AS answer_count").where(user_id: current_user.id).order('created_at DESC')
    .limit(30)
    @question = Question.new(user_id: current_user.id)
    @question.errors.clear
   
    # .select("questions.*, answers.answer, answers.created_at answer_date").where(user_id: current_user.id)
    
    
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @questions = Question.find(params[:id])
    @answers = Answer.where(question_id: params[:id])
  end

  # GET /questions/new
  def new
  end

  # GET /questions/1/edit
  def edit

  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(user_id: current_user.id, question: params[:question])
    @questions = Question.left_joins(:answers).group(:id).select("questions.*, count(answers.id) AS answer_count").where(user_id: current_user.id).order('created_at DESC')

    respond_to do |format|
      if @question.save
        format.html { redirect_to questions_path }
        #format.json { render :index, status: :created, location: @question }
      else
        format.html { render :index }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:user_id, :question)

    end
    
end

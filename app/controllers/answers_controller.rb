class AnswersController < ApplicationController
  def index
    @questions = Question.left_joins(:answers).group(:id).select("questions.*, count(answers.answer) AS answer_count").order('created_at DESC').limit(50)
    @answer = Answer.new
  end
  
  def new
    @questions = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @questions = Question.find(params[:answer][:question_id])

    respond_to do |format|
      if @answer.save
         format.html{ redirect_to answers_path }
      else
        format.html{ render :new }
      end
    end
  end
    
    
     
    
  

  private
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:question_id, :user_id, :answer)

    end
end

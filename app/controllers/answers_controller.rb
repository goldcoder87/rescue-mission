class AnswerController < ApplicationController
  def new
    id=params[:question_id]
    @question=Question.find[id]
    @answer=Answer.new
  end

  def create
    id=params[:question_id]
    @answer=Answer.new(answers_params)
    @question=Question.find(id)
    @answer=question=@question
    if answer.save
      flash[:sucess] = "success"
      redirect_to @question
    else
      flash[:error] = "error"
      redirect_to @question
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end

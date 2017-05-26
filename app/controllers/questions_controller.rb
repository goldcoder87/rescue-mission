class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    id=params[:id]
    @question = Question.find(id)
    @answer=Answer.new
    @answers=@question.answers
  end

  def new
    @question=Question.new
  end

  def create
    @question=Question.new(questions_params)
    if @question.save
      flash[:success] = "Success"
      redirect_to questions_path
    else
      flash[:error] = "Error!"
      render action: 'new'
    end
  end

  def edit
    id=params[:id]
    @question=Question.find(id)
  end

  def update
    id=params[:id]
    @question=Question.find(id)
    @question.update_attributes(questions_params)
    redirect_to @question
  end

  def destroy
    id=params[:id]
    @question = Question.find(id)
    @question.destroy
    @question.answers.destroy_all
    redirect_to questions_path
  end

  private

  def questions_params
    params.require(:question).permit(:title, :body)
  end

end

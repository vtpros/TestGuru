class AnswersController < ApplicationController
  before_action :_question, only: %i[new create]
  before_action :_answer, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def show; end

  def new
    @answer = @question.answers.new
  end

  def edit; end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to @answer
    else
      render :new
    end
  end

  def update
    if @answer.save
      redirect_to @answer, notice: 'Answer was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @answer.destroy
    redirect_to @answer.question
  end

  private

  def _question
    @question ||= Question.find(params[:question_id])
  end

  def _answer
    @answer ||= Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end

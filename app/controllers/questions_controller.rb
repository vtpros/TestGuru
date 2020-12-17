class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :_test, only: %i[create new]
  before_action :_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit
    @test = @question.test
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      @test = @question.test
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to @question.test
  end

  private

  def _test
    @test ||= Test.find(params[:test_id])
  end

  def _question
    @question ||= Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render 'shared/errors/record_not_found', status: :not_found
  end
end

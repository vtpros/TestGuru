class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show; end

  def new
    @question = Question.new
  end

  def create
    question = @test.questions.create!(question_params)

    redirect_to question
  end

  def edit; end

  def update
    @question.update(question_params) ? (render :show) : (render :edit)
  end

  def destroy
    @question.destroy!
    render html: "<h4>Question has been deleted</h4>".html_safe, status: :ok
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render html: helpers.tag.strong("Question doesn't exist"), status: :not_found
  end
end

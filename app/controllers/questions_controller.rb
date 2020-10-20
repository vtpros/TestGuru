class QuestionsController < ApplicationController
  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Question.where(test: @test)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
  end

  def create
    @question = Question.new(
      test: @test,
      body: params[:body]
    )
    @question.save!

    redirect_to question_path(@question)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy!
  end

  private

  def find_test
    @test = Test.find(params[:test_id]) if params[:test_id]
  end

  def rescue_with_question_not_found
    render plain: "Question doesn't exist"
  end
end

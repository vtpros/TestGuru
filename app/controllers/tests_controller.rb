class TestsController < ApplicationController
  before_action :find_test, only: %i[show]
  before_action :find_questions, only: :show

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show; end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_questions
    @questions = @test.questions
  end

  def rescue_with_test_not_found
    render 'shared/errors/record_not_found', status: :not_found
  end
end

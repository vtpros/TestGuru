class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :test, only: :start
  before_action :test_completeness, only: :start

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def start
    user = current_user
    user.tests.push(@test)
    redirect_to user.test_passage(@test)
  end

  private

  def rescue_with_test_not_found
    render 'shared/errors/record_not_found', status: :not_found
  end

  def test
    @test ||= Test.find(params[:id])
  end

  def test_completeness
    return unless @test.questions.blank? || @test.questions.any? { |q| q.answers.blank? }

    redirect_to tests_path, danger: t('.not_completed')
  end
end

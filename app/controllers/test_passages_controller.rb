class TestPassagesController < ApplicationController
  before_action :_test_passage, only: %i[show update result]
  before_action :authenticate_user!

  def index
    @test_passages = TestPassage.by_user(current_user)
  end

  def show
    render :result if @test_passage.completed?
  end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      @test_passage.set_result
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def _test_passage
    @test_passage ||= TestPassage.find(params[:id])
  end
end

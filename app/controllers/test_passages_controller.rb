class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result]

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

  def find_test_passage
    @test_passage ||= TestPassage.find(params[:id])
  end
end

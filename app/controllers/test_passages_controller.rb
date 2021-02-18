class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :_test_passage, only: %i[show update result gist]

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
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question).call
    flash_options = if service
      { success: t('.success', url: service.gist_url) }
    else
      { danger: t('.failure') }
    end
    redirect_to @test_passage, flash_options
  end

  private

  def _test_passage
    @test_passage ||= TestPassage.find(params[:id])
  end
end

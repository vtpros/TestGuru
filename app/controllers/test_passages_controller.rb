class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :test_passage, only: %i[show update result gist]

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
    question = @test_passage.current_question
    new_gist = GistQuestionService.new(question, current_user).create_gist
    new_gist&.save
    flash_options = if new_gist
                      { success: t('.success_html', link: gist_link(new_gist.url)) }
                    else
                      { danger: t('.failure') }
                    end
    redirect_to @test_passage, flash_options
  end

  private

  def test_passage
    @test_passage ||= TestPassage.find(params[:id])
  end

  def gist_link(url)
    gist_hash = url[url.rindex('/') + 1..-1]
    view_context.link_to gist_hash, url
  end
end

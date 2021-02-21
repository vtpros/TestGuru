class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.all
  end

  def create
    test_passage = TestPassage.find(gist_params[:id])
    question = test_passage.current_question
    new_gist = GistQuestionService.new(question, current_user).build_gist
    new_gist&.save
    flash_options = if new_gist
                      { success: t('.success_html', link: gist_link(new_gist)) }
                    else
                      { danger: t('.failure') }
                    end
    redirect_to test_passage, flash_options
  end

  def destroy
    @gist = Gist.find(params[:id])
    @gist.destroy
    redirect_to admin_gists_path
  end

  private

  def gist_params
    params.require(:test_passage).permit(:id)
  end

  def gist_link(gist)
    view_context.link_to gist.gist_hash, gist.url
  end
end

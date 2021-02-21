class GistQuestionService
  def initialize(question, user, client: nil)
    @question = question
    @user = user
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def build_gist
    result = @client.build_gist(gist_params)
    return nil unless result

    new_gist
  end

  def gist_url
    @client.gist_url
  end

  def gist_hash
    @client.gist_hash
  end

  private

  def gist_params
    {
      description: I18n.t('app.gist_question', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def new_gist
    gist_params = { url: gist_url, gist_hash: gist_hash, question: @question, user: @user }
    Gist.new(gist_params)
  end

  def new_gist_params
    { url: gist_url, gist_hash: gist_hash, question: @question, user: @user }
  end
end

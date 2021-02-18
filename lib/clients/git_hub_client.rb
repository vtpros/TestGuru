class GitHubClient  
  ACCESS_TOKEN = 'secret'

  def initialize
    @github_client = setup_github_client
  end

  def create_gist(params)
    begin
      @gist = client.create_gist(params)
      self
    rescue
    end
  end

  def gist_url
    @gist.html_url if @gist
  end

  private

  def setup_github_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end

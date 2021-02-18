class GitHubClient
  ACCESS_TOKEN = ENV['GITHUB_ACCESS_TOKEN']

  def initialize
    @github_client = setup_github_client
  end

  def create_gist(params)
    @gist = @github_client.create_gist(params)
    self
    rescue
  end

  def gist_url
    @gist.html_url if @gist
  end

  private

  def setup_github_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end

class GitHubClient
  ACCESS_TOKEN = ENV.fetch('GITHUB_ACCESS_TOKEN')

  def initialize
    @github_client = setup_github_client
  end

  def build_gist(params)
    @raw_gist = @github_client.create_gist(params)
    @response = @github_client.last_response.status
    self
  rescue => e
    nil
  end

  def success?
    @response == 201
  end

  def gist_hash
    @raw_gist&.id
  end

  def gist_url
    @raw_gist&.html_url
  end

  private

  def setup_github_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end

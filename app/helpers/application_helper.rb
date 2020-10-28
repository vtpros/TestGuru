module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(options)
    link_to options[:text], "https://github.com/#{options[:author]}/#{options[:repo]}/"
  end
end

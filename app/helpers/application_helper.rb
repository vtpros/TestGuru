module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(options)
    link_to options[:text], "https://github.com/#{options[:author]}/#{options[:repo]}/"
  end

  def flash_msg(type, message)
    tag.p message, class: "alert alert-#{type}"
  end
end

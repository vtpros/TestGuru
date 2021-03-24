class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru" <mail@obscure-lake-55579.herokuapp.com>)
  layout 'mailer'
end

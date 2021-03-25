class FeedbacksMailer < ApplicationMailer
  def feedback(text, user)
    @text = text
    @user = user
    admin = Admin.first

    mail to: admin.email, subject: "New feedback"
  end
end

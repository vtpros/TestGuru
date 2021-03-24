class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def show; end

  def create
    result = FeedbacksMailer.feedback(feedback_text, current_user).deliver_now
    redirect_to root_path, success: t('.sent')
  end

  private

  def feedback_text
    params.permit(:text)[:text]
  end
end

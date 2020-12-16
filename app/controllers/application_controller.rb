class ApplicationController < ActionController::Base
  private

  helper_method :current_user,
                :logged_in?                

  def authenticate_user!
    unless current_user
      session[:URI] = request.url
      redirect_to login_path, alert: 'Are you a Guru? Verify your email and password please'
    end

    cookies[:email] = @current_user&.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end

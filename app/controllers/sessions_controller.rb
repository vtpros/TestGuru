class SessionsController < ApplicationController
  def new
    redirect_to root_path if session[:user_id]
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:URI] || root_path
      session.delete(:URI)
    else
      flash.now[:alert] = 'Are you a Guru? Verify your email and password please'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
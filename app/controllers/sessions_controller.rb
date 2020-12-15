class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  include Authenticatible

  def new; end

  def create
    authenticate(params[:email], params[:password])
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path
  end
end

class UsersController < ApplicationController

  skip_before_action :authenticate_user!

  include Authenticatible

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.email.exclude?('@')
      redirect_to signup_path, alert: 'Invalid e-mail address'
    elsif exists?
      redirect_to signup_path, alert: 'Account with this email already exists'
    else
      if @user.save
        authenticate(user_params[:email], user_params[:password])
        #redirect_to login_path
      else
        render :new
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def exists?
    User.find_by(email: user_params[:email])
  end
end

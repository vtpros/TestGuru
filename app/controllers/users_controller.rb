class UsersController < ApplicationController

  skip_before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
    if user_params[:email].exclude?('@')
      redirect_to login_path, alert: 'Invalid e-mail address'
    elsif exists?
      redirect_to login_path, alert: 'Account with this email already exists'
    else
      @user = User.new(user_params)

      if @user.save
        redirect_to login_path
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

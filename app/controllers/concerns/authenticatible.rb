module Authenticatible
  def authenticate(email, password)
    user = User.find_by(email: email)

    if user&.authenticate(password)
      session[:user_id] = user.id
      redirect_to session[:URI] || root_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your email and password please'
      render :new
    end
  end
end

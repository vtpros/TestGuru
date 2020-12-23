class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    permitted_list = %i[first_name last_name]
    devise_parameter_sanitizer.permit(:sign_up, keys: permitted_list)
    devise_parameter_sanitizer.permit(:account_update, keys: permitted_list)
  end

  # custom devise redirect path for Admin login
  def after_sign_in_path_for(resource)
    (admin_tests_path if current_user&.is_a?(Admin)) || super
  end

  # custom flash notice on devise sign_in
  def sign_in(resource_or_scope, *args)
    flash[:notice] = "Hello, #{current_user.first_name}!"
    super
  end
end

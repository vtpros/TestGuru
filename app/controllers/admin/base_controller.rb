class Admin::BaseController < ApplicationController
  UN_AUTHARIZED = 'You are not authorized to view this page'.freeze
  
  before_action :authenticate_user!
  before_action :authenticate_admin!

  layout 'admin'

  private

  def authenticate_admin!
    redirect_to root_path, alert: UN_AUTHARIZED unless current_user.is_a?(Admin)
  end
end

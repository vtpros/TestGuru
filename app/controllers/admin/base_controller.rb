class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  layout 'admin'

  private

  def authenticate_admin!
    redirect_to root_path, alert: t('app.unauthorized') unless current_user.is_a?(Admin)
  end
end

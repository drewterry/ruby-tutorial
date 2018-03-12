class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def admin_check
    unless current_user.admin?
      flash.alert = 'Requires Admin Access!'
      redirect_to articles_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name display_name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name display_name])
  end
end

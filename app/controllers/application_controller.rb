class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def require_admin
    #Need to call authenticate user here as it was skipped to call the sign in
    authenticate_user!
    unless current_user.admin
      redirect_to root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number])
  end
end

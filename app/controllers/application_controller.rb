class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  private
    def require_admin
      #Need to call authenticate user here as it was skipped to call the sign in
      authenticate_user!
      unless admin?
        redirect_to root_path
      end
    end

    def admin?
      current_user.admin
    end
end

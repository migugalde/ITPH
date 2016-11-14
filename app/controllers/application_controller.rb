class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  private
    def require_admin
      byebug
      unless admin?
        redirect_to new_user_session
      end
    end

    def admin?
      current_user.admin
    end
end

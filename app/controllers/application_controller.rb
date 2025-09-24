class ApplicationController < ActionController::Base
  # helper functions are only for views, to use them in controllers as well use helper_method
  helper_method :current_user, :logged_in?
    def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
    # !! converts any value to boolean, baad me check karne time help hoga!
    !!current_user
    end

    def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
    end
end

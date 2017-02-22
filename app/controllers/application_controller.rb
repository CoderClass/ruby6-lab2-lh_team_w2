class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  def signed_in?
    if session[:user_id]
      return true
    else
      return false
    end
  end

  def current_user
    return @current_user if @current_user

    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end
end

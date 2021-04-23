class ApplicationController < ActionController::Base

private

  def authenticate_user
    unless current_user
      session[:intended_url] = request.url
      redirect_to new_session_path ,alert: "You need to be signed In"
    end
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?(user)
    current_user == user
  end

  def verify_admin
    unless current_user_admin?
      redirect_to events_path notice: "Admins Only"
    end
  end

  def current_user_admin?
    current_user && current_user.admin  
  end

  helper_method :current_user
  helper_method :current_user?
  helper_method :verify_admin
  helper_method :current_user_admin?

  
end

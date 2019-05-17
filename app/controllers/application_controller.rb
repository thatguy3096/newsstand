class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
  helper_method :current_user 
	
  def redirect_to(options = {}, response_status = {})
    ::Rails.logger.error("redirected by #{caller(1).first rescue "unknown"}")
    super(options, response_status)
  end
  
  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end 
  
  def require_user
  	redirect_to '/login' unless current_user  
  end
  
end
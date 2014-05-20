class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize

  protected

  def authorize
    unless admin?
      flash[:notice] = "Unauthorized access"
      redirect_to '/'
      false
    end
  end

  def admin?
    session[:password] == ENV["PW"]
  end
  helper_method :admin?
  
end

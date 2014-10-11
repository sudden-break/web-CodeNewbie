class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :need_email
  # before_action :authorize

  protected

  def authorize
    unless admin?
      flash[:notice] = "Unauthorized access uhoh!"
      redirect_to '/'
      false
    end
  end

  def admin?
    session[:password] == ENV["PW"]
  end
  helper_method :admin?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :remember_me, :username]
  end

  def need_email
    redirect_to edit_email_path if current_user && current_user.email.include?("twitter")
  end

end

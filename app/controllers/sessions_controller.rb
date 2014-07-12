class SessionsController < ApplicationController

  def new
  end

  def create
  end

  def destroy
    reset_session
    flash[:notice] = 'You out!'
    redirect_to '/'
  end

  def admin_new
  end

  def create_admin
    session[:password] = params[:password]
    flash[:notice] = 'Yea gurl!' if params[:password] == ENV["PW"]
    redirect_to '/'
  end

end

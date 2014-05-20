class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    session[:password] = params[:password]
    flash[:notice] = 'Yea gurl!' if params[:password] == ENV["PW"]
    redirect_to '/'
  end

  def destroy
    reset_session
    flash[:notice] = 'You out!'
    redirect_to '/'
  end

end
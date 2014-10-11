class UserController < ApplicationController
  skip_before_action :need_email

  def edit_email
    @user = current_user
  end

  def update_email
    current_user.update(:email => email_params[:email])
    if current_user.save
      if session[:payload]
        redirect_to sso_path
      else
        redirect_to root_url
      end
    else
      flash[:notice] = current_user.errors.full_messages.join(". ")
      redirect_to edit_email_path
    end
  end

  private

  def email_params
    params.require(:user).permit(:email)
  end

end

class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # after_action :redirect_to_sso
  
  def twitter
    auth = env["omniauth.auth"]

    @user = User.find_for_twitter_oauth(request.env["omniauth.auth"], current_user)

    if @user.email.include?("twitter.com")
      sign_in @user
      redirect_to edit_email_path
    elsif  @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success"

      if session["sso"]
        sign_in @user 
        redirect_to_sso
      else
        sign_in_and_redirect @user, :event => :authentication, :kind => "twitter_yo"
      end
    else
      session["devise.twitter_uid"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  private 

  def redirect_to_sso
    if session["sso"]
      secret = ENV['DISCOURSE_SECRET']
      sso = SingleSignOn.parse(session[:payload], secret)
      session[:sso] = true
      redirect_to sso.to_url(sso_path(:query_string => session[:payload]))
    end
  end

end
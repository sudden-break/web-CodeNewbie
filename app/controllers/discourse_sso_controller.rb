class DiscourseSsoController < ApplicationController

  def sso
    secret = ENV['DISCOURSE_SECRET']

    sso = SingleSignOn.parse(sso_payload, secret)
    session[:sso] = true
    session[:payload] = request.query_string if !session[:payload]

    if current_user
        session[:sso] = false
        session[:payload] = nil
        sso.email = current_user.email
        sso.name = current_user.name
        sso.username = current_user.username
        sso.avatar_url = current_user.avatar
        sso.external_id = current_user.id # unique to your application
        sso.sso_secret = secret
        redirect_to sso.to_url("http://discourse.codenewbie.org/session/sso_login")
    else
        redirect_to sso.to_url(new_user_session_path)
    end
  end

  private

  def sso_payload
    session[:payload] || request.query_string
  end

end

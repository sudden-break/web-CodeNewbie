class DeviseSessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, only: [ :new, :create, :cancel ]

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?

    if session[:payload]
      redirect_to_sso
    else
      respond_with resource, location: after_sign_in_path_for(resource)
    end
  end

  private

  def redirect_to_sso
    current_user
    secret = ENV['DISCOURSE_SECRET']
    sso = SingleSignOn.parse(session[:payload], secret)
    session[:sso] = true
    redirect_to sso.to_url(sso_path(:query_string => session[:payload]))
  end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

  def build_resource(hash=nil)
    self.resource = resource_class.new_with_session(hash || {}, session)
  end

end
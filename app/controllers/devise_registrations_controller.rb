class DeviseRegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, only: [ :new, :create, :cancel ]


  def create
    build_resource(sign_up_params)

    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)

        if session[:payload]
            redirect_to_sso
          else
            respond_with resource, location: after_sign_up_path_for(resource)
          end      
        else
      
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      @validatable = devise_mapping.validatable?
      if @validatable
        @minimum_password_length = resource_class.password_length.min
      end
      if session[:payload]
        redirect_to_sso
      else
        respond_with resource
      end
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

end
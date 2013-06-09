class Api::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def facebook
    Rails.logger.info ">>>>> #{request.env['omniauth.auth']['credentials']}"
    
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in @user
    else
      #session["devise.facebook_data"] = request.env["omniauth.auth"]
      # redirect_to new_user_registration_url
    end

    return_to = cookies[:return_to]
    Rails.logger.info "@@@@@ #{return_to}"
    if return_to.present?
      cookies[:return_to] = nil
      redirect_to return_to
      return
    end

    redirect_to '/'
  end

  def twitter
    Rails.logger.info ">>>>> #{request.env['omniauth.auth']['credentials']}"
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    sign_in @user
    redirect_to '/'
  end

end
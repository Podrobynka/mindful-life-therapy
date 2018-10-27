class LoginsController < ApplicationController
  def new
  end

  def create
    if user = authenticate_with_google
      cookies.signed[:user_id] = user.id
      redirect_to admin_url, notice: "Welcome #{user.name}"
    else
      redirect_to login_url, alert: 'Authentication failed, are you a registered member of the site?'
    end
  end

  def destroy
    cookies.delete :user_id
    redirect_to root_url, notice: "Successfully logged out"
  end

  private
    def authenticate_with_google
      token = flash[:google_sign_in_token]

      if token.present?
        identity = GoogleSignIn::Identity.new token
        update_zoe(identity)
        User.find_by google_id: identity.user_id
      end
    end

    # This will set zoe's google id to correct value the first time she logs in.
    # This code will be removed once we have the correct user id for her.
    def update_zoe identity
      zoe = User.find_by name: 'Zoe'

      if zoe.present?
        if identity.email_address == zoe.email
          if zoe.google_id == Rails.application.credentials.dig(:users, :zoe, :google_id)
            zoe.update google_id: identity.user_id
          end
        end
      end
    end
end

class LoginsController < ApplicationController
  def new
    if current_user
      flash[:notice] = 'You are already logged in'
      redirect_to root_url
    end
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
      old_user_id = Rails.application.credentials.dig(:users, :zoe, :google_id)

      # make sure zoe exists in db
      if zoe.present?

        # make sure zoe has logged in with the correct account
        if identity.email_address == zoe.email

          # make sure zoe's google_id is still set to the random string i used when initializing her account
          if zoe.google_id == old_user_id.to_s

            # update her google_id to the correct value
            zoe.update google_id: identity.user_id
          end
        end
      end
    end
end

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
      if flash[:google_sign_in_token].present?
        token = flash[:google_sign_in_token]
        google_id = GoogleSignIn::Identity.new(token).user_id
        User.find_by google_id: google_id
      end
    end
end

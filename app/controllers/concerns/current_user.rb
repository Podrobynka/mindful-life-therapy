module CurrentUser
  extend ActiveSupport::Concern

  def current_user
    if (user_id = cookies.signed[:user_id])
      @current_user ||= User.find_by(id: user_id)
    end
  end

  def login_required
    redirect_to login_url unless current_user
  end

  included { helper_method :current_user }
end

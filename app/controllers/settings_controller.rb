class SettingsController < ApplicationController
  before_action :login_required

  def edit
  end

  def update
    if @settings.update(setting_params)
      redirect_to admin_path, notice: 'Site settings were successfully updated.'
    else
      render :edit
    end
  end

  private

    def setting_params
      params.require(:setting).permit(:telephone, :email, :office_address_line_1, :office_address_line_2, :office_address_line_3, :office_address_city, :office_address_postcode, :session_rate)
    end
end

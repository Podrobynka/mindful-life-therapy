class SettingsController < ApplicationController

  # GET /settings
  def show
  end

  # GET /settings/edit
  def edit
  end

  # PATCH/PUT /settings/1
  def update
    if @setting.update(setting_params)
      redirect_to settings_path, notice: 'Site settings were successfully updated.'
    else
      render :edit
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def setting_params
      params.require(:setting).permit(:telephone, :contact_email, :office_address, :hourly_rate)
    end
end

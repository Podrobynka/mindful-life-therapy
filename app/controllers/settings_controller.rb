class SettingsController < ApplicationController
  before_action :set_setting, only: [:show, :edit, :update]

  # GET /settings/1
  def show
  end

  # GET /settings/1/edit
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
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = Setting.first
    end

    # Only allow a trusted parameter "white list" through.
    def setting_params
      params.require(:setting).permit(:telephone, :contact_email, :office_address, :hourly_rate)
    end
end

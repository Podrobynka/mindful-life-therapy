class ApplicationController < ActionController::Base
  before_action :set_site_settings

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_site_settings
    @settings = Setting.first
  end
end

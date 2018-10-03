class ApplicationController < ActionController::Base
  before_action :set_site_settings

  private

    def set_site_settings
      @settings = Setting.first
    end
end

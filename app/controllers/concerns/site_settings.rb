module SiteSettings
  extend ActiveSupport::Concern

  included do
    before_action :set_site_settings
  end

  private

    def set_site_settings
      @settings = Setting.first
    end
end

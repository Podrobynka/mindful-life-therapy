class ApplicationController < ActionController::Base
  include CurrentUser, SiteSettings, Rescuer
end

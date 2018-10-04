module Rescuer
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActionController::RoutingError, with: :not_found
    rescue_from ActionController::UnknownFormat, with: :not_found
  end

  def raise_routing_error
    raise ActionController::RoutingError, request.original_url
  end

  private

    def not_found
      render template: 'errors/not_found', status: :not_found, layout: 'application', formats: :html
    end
end

# frozen_string_literal: true

module RoutesLazyRoutes
  class RoutesReloaderWrapper
    delegate :paths, :eager_load=, :updated?, :route_sets, to: :@original_routes_reloader

    def initialize(original_routes_reloader)
      @original_routes_reloader = original_routes_reloader

      Rails.application.config.middleware.use LazyRoutesMiddleware, original_routes_reloader
    end

    def execute
      # pretty vacant
    end

    def reload!
      Rails.application.instance_variable_set :@routes_reloader, @original_routes_reloader
      @original_routes_reloader.execute
    end
  end
end

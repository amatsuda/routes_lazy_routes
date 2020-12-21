# frozen_string_literal: true

module RoutesLazyRoutes
  class RoutesReloaderWrapper
    delegate :paths, :eager_load=, :updated?, :route_sets, :external_routes, to: :@original_routes_reloader

    def initialize(original_routes_reloader)
      @original_routes_reloader = original_routes_reloader
      @mutex = Mutex.new
    end

    def execute
      # pretty vacant
    end

    def reload!
      @mutex.synchronize do
        if Rails.application.routes_reloader == self
          Rails.application.instance_variable_set :@routes_reloader, @original_routes_reloader
          @original_routes_reloader.execute
        end
      end
    end
  end
end

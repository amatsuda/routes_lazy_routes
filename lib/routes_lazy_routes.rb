# frozen_string_literal: true

require_relative 'routes_lazy_routes/version'
require_relative 'routes_lazy_routes/lazy_routes_middleware'
require_relative 'routes_lazy_routes/routes_reloader_wrapper'
require_relative 'routes_lazy_routes/railtie'

module RoutesLazyRoutes
  class << self
    # The root of evil
    def arise!
      Rails::Application::RoutesReloader.class_eval do
        class << self
          def new
            RoutesLazyRoutes::RoutesReloaderWrapper.new super
          end
        end
      end
    end
  end
end

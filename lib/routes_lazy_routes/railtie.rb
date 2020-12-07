# frozen_string_literal: true

require_relative 'application'

module RoutesLazyRoutes
  class Railtie < ::Rails::Railtie
    initializer 'routes_lazy_routes', before: :add_routing_paths do
      RoutesLazyRoutes.arise!

      Rails.application.config.middleware.use LazyRoutesMiddleware

      Rails.application.extend RoutesLazyRoutes::Application

      ActiveSupport.on_load :action_dispatch_integration_test, run_once: true do
        RoutesLazyRoutes.eager_load!
      end
    end
  end
end

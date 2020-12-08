# frozen_string_literal: true

require_relative 'application'

module RoutesLazyRoutes
  class Railtie < ::Rails::Railtie
    # Extending `load_tasks` has to be done very early, like before executing any initializer, so here it is
    Rails::Application.prepend RoutesLazyRoutes::Application::TaskLoader

    initializer :routes_lazy_routes, before: :add_routing_paths do
      RoutesLazyRoutes.arise!

      Rails.application.config.middleware.use LazyRoutesMiddleware

      Rails.application.extend RoutesLazyRoutes::Application::LoadRunner

      ActiveSupport.on_load :action_dispatch_integration_test, run_once: true do
        RoutesLazyRoutes.eager_load!
      end
    end
  end
end

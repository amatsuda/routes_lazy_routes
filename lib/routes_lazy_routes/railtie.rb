# frozen_string_literal: true

module RoutesLazyRoutes
  class Railtie < ::Rails::Railtie
    initializer 'routes_lazy_routes', before: :add_routing_paths do
      RoutesLazyRoutes.arise!

      Rails.application.config.middleware.use LazyRoutesMiddleware
    end
  end
end

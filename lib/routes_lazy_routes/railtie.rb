# frozen_string_literal: true

require_relative 'application'

module RoutesLazyRoutes
  class Railtie < ::Rails::Railtie
    # Extending the following modules have to be done very early, like before executing any initializer, so here it is
    Rails::Application.prepend RoutesLazyRoutes::Application::TaskLoader

    if defined? Rails::Command::RoutesCommand
      require_relative 'command/routes_command'
      Rails::Command::RoutesCommand.prepend RoutesLazyRoutes::Command::RoutesCommand
    end

    initializer :routes_lazy_routes, before: :add_routing_paths do
      RoutesLazyRoutes.arise!

      Rails.application.config.middleware.use LazyRoutesMiddleware

      Rails.application.extend RoutesLazyRoutes::Application::LoadRunner

      ActiveSupport.on_load :action_dispatch_integration_test, run_once: true do
        RoutesLazyRoutes.eager_load!
      end
    end

    console do
      ActiveSupport.on_load(:action_mailer) do
        before_action { RoutesLazyRoutes.eager_load! }
      end
    end
  end
end

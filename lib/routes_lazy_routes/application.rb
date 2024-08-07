# frozen_string_literal: true

module RoutesLazyRoutes
  module Application
    module LoadRunner
      # We expect `Rails.application.eager_load!` to load all routes as well
      def eager_load!
        RoutesLazyRoutes.eager_load!

        super
      end
    end

    module TaskLoader
      # A monkey-patch that loads our Rake task for enhancing `rake routes` after Rails loads all other tasks.
      # Just declaring our own `rake_tasks` in the railtie cannot achieve this, since calling each railtie's `rake_tasks` is done before requiring "rails/tasks",
      # so enhancing Rails' Rake task from a gem this way seems impossible.
      def load_tasks(*)
        super

        load "#{__dir__}/tasks/routes_lazy_routes.rake"
      end
    end

    # A monkey-patch that eager loads routes before the routes command is executed by prepending this module to the
    # require_environment! method that's called when boot_application! is executed performing console commands.
    module RoutesCommandEagerLoader
      def require_environment!
        super

        RoutesLazyRoutes.eager_load!
      end
    end
  end
end

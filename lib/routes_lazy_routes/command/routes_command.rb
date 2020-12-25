# frozen_string_literal: true

module RoutesLazyRoutes
  module Command
    module RoutesCommand
      # A monkey-patch that eager_loads the routes right before running the `rails routes` command.
      def require_environment!
        super

        RoutesLazyRoutes.eager_load!
      end
    end
  end
end

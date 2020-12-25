# frozen_string_literal: true

module RoutesLazyRoutes
  module Command
    module RoutesCommand
      def require_environment!
        super

        RoutesLazyRoutes.eager_load!
      end
    end
  end
end

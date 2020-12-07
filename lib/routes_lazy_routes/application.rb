# frozen_string_literal: true

module RoutesLazyRoutes
  module Application
    # We expect `Rails.application.eager_load!` to load all routes as well
    def eager_load!
      RoutesLazyRoutes.eager_load!

      super
    end
  end
end

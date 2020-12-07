# frozen_string_literal: true

module RoutesLazyRoutes
  class LazyRoutesMiddleware
    def initialize(app)
      @app = app
      @loaded = false
    end

    def call(env)
      unless @loaded
        RoutesLazyRoutes.eager_load!
        @loaded = true
      end

      @app.call env
    end
  end
end

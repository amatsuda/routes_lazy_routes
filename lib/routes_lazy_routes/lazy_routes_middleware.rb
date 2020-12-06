# frozen_string_literal: true

module RoutesLazyRoutes
  class LazyRoutesMiddleware
    def initialize(app, original_routes_reloader)
      @app = app
      @original_routes_reloader = original_routes_reloader
      @loaded = false
    end

    def call(env)
      unless @loaded
        @app.instance_variable_set :@routes_reloader, @original_routes_reloader
        @original_routes_reloader.execute
        @loaded = true
      end

      @app.call env
    end
  end
end

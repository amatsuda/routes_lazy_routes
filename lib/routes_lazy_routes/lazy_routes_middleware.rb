# frozen_string_literal: true

module RoutesLazyRoutes
  class LazyRoutesMiddleware
    def initialize(app, original_routes_reloader)
      @app = app
      @original_routes_reloader = original_routes_reloader
      @mutex = Mutex.new
      @loaded = false
    end

    def call(env)
      unless @loaded
        @mutex.synchronize do
          @app.instance_variable_set :@routes_reloader, @original_routes_reloader
          @original_routes_reloader.execute
          @loaded = true
        end
      end

      @app.call env
    end
  end
end

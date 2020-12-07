# frozen_string_literal: true

module RoutesLazyRoutes
  class LazyRoutesMiddleware
    def initialize(app)
      @app = app
      @mutex = Mutex.new
      @loaded = false
    end

    def call(env)
      unless @loaded
        @mutex.synchronize do
          RoutesLazyRoutes.eager_load!
          @loaded = true
        end
      end

      @app.call env
    end
  end
end

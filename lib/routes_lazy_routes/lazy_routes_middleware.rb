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
          if RoutesLazyRoutes::RoutesReloaderWrapper === (reloader = Rails.application.routes_reloader)
            reloader.reload!
          end
          @loaded = true
        end
      end

      @app.call env
    end
  end
end

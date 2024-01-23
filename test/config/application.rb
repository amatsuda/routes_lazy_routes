# frozen_string_literal: true

module RoutesLazyRoutesTestApp
  Application = Class.new(Rails::Application) do
    config.eager_load = false
    config.active_support.deprecation = :log
    config.root = File.expand_path('..', __dir__)
    config.secret_key_base = 'Routes, lazy routes.' * 4
  end
end

RoutesLazyRoutesTestApp::Application.initialize!

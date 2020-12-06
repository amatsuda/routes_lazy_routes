# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require 'rails'
require 'byebug'
require "routes_lazy_routes"

require "minitest/autorun"

ENV['RAILS_ENV'] ||= 'test'

module RoutesLazyRoutesTestApp
  Application = Class.new(Rails::Application) do
    config.eager_load = false
    config.active_support.deprecation = :log
    config.root = __dir__
    config.secret_key_base = 'Routes, lazy routes.' * 4
  end
end

RoutesLazyRoutesTestApp::Application.initialize!

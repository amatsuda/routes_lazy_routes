# frozen_string_literal: true

ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../../Gemfile", __dir__)

require "bundler/setup"

require "rails"
require "action_controller/railtie"

# Bundler.require(*Rails.groups)

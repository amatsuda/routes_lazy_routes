# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require 'rails'
require 'byebug'
require 'action_controller'
require "routes_lazy_routes"

require "minitest/autorun"

ENV['RAILS_ENV'] ||= 'test'

require_relative 'config/application'

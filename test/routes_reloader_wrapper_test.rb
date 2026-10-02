# frozen_string_literal: true

require "test_helper"

class RoutesReloaderWrapperTest < Minitest::Test
  def test_wrapper_responds_to_current_rails_setter
    # Rails::Application::RoutesReloader.new is overridden by arise! to return a
    # RoutesReloaderWrapper, so we must bypass .new to get a real reloader for testing.
    original = Rails::Application::RoutesReloader.allocate
    original.send(:initialize)
    wrapper = RoutesLazyRoutes::RoutesReloaderWrapper.new(original)

    assert wrapper.respond_to?(:run_after_load_paths=) || wrapper.respond_to?(:run_once_after_load_paths=),
           "RoutesReloaderWrapper must delegate the routes-reloader setter for the current Rails version"
  end
end

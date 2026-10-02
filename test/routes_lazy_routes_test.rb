# frozen_string_literal: true

require "test_helper"

class RoutesLazyRoutesTest < Minitest::Test
  def test_it_lazily_loads_the_routes
    app_routes = -> { Rails.application.routes.routes.reject(&:internal) }

    assert_equal 0, app_routes.call.length

    RoutesLazyRoutes.eager_load!

    assert_equal 1, app_routes.call.length
  end
end

# frozen_string_literal: true

require "test_helper"

class RoutesLazyRoutesTest < Minitest::Test
  def test_it_lazily_loads_the_routes
    assert_equal 0, Rails.application.routes.routes.length

    RoutesLazyRoutes.eager_load!

    assert_equal 1, Rails.application.routes.routes.length
  end
end

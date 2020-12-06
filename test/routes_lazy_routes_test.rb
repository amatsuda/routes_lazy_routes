# frozen_string_literal: true

require "test_helper"

class RoutesLazyRoutesTest < ActionDispatch::IntegrationTest
  def test_it_lazily_loads_the_routes
    assert_equal 0, Rails.application.routes.routes.length

    get '/foo'
    assert_response :success
    assert_equal 'hello', body

    assert_equal 1, Rails.application.routes.routes.length

    get '/foo'
    assert_response :success
    assert_equal 'hello', body
  end
end

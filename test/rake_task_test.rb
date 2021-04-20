# frozen_string_literal: true

require "test_helper"

class RakeTaskTest < Minitest::Test
  def test_that_rake_task_properly_loads
    # Just testing that loading the rake task doesn't raise any error
    Rails.application.load_tasks
  end
end

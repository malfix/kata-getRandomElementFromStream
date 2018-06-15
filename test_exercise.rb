require_relative "exercise"
require "test/unit"

class TestExercise < Test::Unit::TestCase
  test 'simple' do
    assert_equal(1, Exercise.new().pick_random(1))
  end
end

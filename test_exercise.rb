require_relative "exercise"
require "test/unit"

class TestExercise < Test::Unit::TestCase
  test 'simple' do
    assert_equal(1, Exercise.new().pick_random(random_array(1)))
  end

  def random_array(max)
    (1...(max+1)).to_a.shuffle
  end
end

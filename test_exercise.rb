require_relative "exercise"
require "test/unit"

class TestExercise < Test::Unit::TestCase
  test 'simple' do
    el = Exercise.new()
    assert_equal(1, el.pick_random(random_array(1)))
    assert_equal(1, el.max_size)
  end

  test 'test max size' do
    el = Exercise.new()
    el.pick_random(random_array(100000))
    assert_equal(16, el.max_size)
  end

  test 'simple 2 elements' do
    assert_try_with 2, 1000
  end

  test 'simple 3 elements' do
    assert_try_with 3, 3000
  end

  test 'simple 10 elements' do
    assert_try_with 10, 10000
  end

  test 'simple 9 elements' do
    assert_try_with 9, 9000
  end


  test 'simple 17 elements' do
    assert_try_with 17, 17000
  end

  test 'find in range' do
    assert_equal(100,Exercise.new().find_in_range({'0':100, '1': 1, '2':1},1))
    assert_equal(100,Exercise.new().find_in_range({'0':1, '1': 100, '2':1},2))
    assert_equal(100,Exercise.new().find_in_range({'0':1, '1': 100, '2':1},3))
    assert_equal(100,Exercise.new().find_in_range({'0':1, '1': 1, '2':100},4))
    assert_equal(100,Exercise.new().find_in_range({'0':1, '1': 1, '2':100},5))
    assert_equal(100,Exercise.new().find_in_range({'0':1, '1': 1, '2':100},6))
    assert_equal(100,Exercise.new().find_in_range({'0':1, '1': 1, '2':100},7))
  end

  test 'calc max for map' do
    assert_equal(1,Exercise.new().build_max_for({'0':100}))
    assert_equal(2,Exercise.new().build_max_for({'1': 100}))
    assert_equal(6,Exercise.new().build_max_for({'1': 100, '2':1}))
    assert_equal(4,Exercise.new().build_max_for({'2':100}))
    assert_equal(5,Exercise.new().build_max_for({'0':1,  '2':100}))
    assert_equal(7,Exercise.new().build_max_for({'0':1, '1': 1, '2':100}))
  end

  def random_array(max)
    (1...(max+1)).to_a
  end

  def assert_try_with(size, throws)
    results = {}
    throws.times.each do |t|
      idx = Exercise.new().pick_random(random_array(size))
      results["#{idx}"] = (results["#{idx}"] || 0) + 1
    end
    lower_limit = throws/size*0.9
    upper_limit = throws/size*1.1
    results.each do |k,v|
      assert v > lower_limit, "si è rotto per i valori #{k} => #{v}"
      assert v < upper_limit, "si è rotto per i valori #{k} => #{v}"
    end
  end
end

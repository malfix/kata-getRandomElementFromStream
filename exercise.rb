class Exercise
  def initialize(*steps)
    @steps = steps.sort.uniq
  end

  def findCombinations(staircase_steps)
    try_steps(staircase_steps)
  end

  def try_steps(steps_left)
    return 1 if  steps_left == 0
    return 0 if steps_left < 0

    sum_valid_path = 0
    @steps.each { |step| sum_valid_path += try_steps(steps_left - step) }
    sum_valid_path
  end
end

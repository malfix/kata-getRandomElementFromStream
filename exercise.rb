class Exercise
  def initialize
    @get_max_size = 0
  end

  def pick_random(stream)
    result_map = {}
    stream.each do |el|
      exp = 0
      last_el = el
      while (result_map["#{exp}"])
        last_el = [result_map["#{exp}"], last_el].shuffle[0]
        result_map.delete("#{exp}")
        exp += 1
      end
      result_map["#{exp}"] = last_el
      @get_max_size = [result_map.size, @get_max_size].max
    end
    max_val = build_max_for(result_map)
    find_in_range(result_map, Random.rand(max_val) + 1)
  end

  def find_in_range(map,value_to_find)
    value = value_to_find
    map.keys.sort.each do |k|
      actual = k.to_s.to_i
      pow = 2 ** actual
      value -= pow

      return map[k] if value <= 0
    end
    nil
  end

  def build_max_for(map)
    value = 0
    map.keys.each do |k|
      actual = k.to_s.to_i
      pow = 2 ** actual
      value += pow
    end
    value
  end

  def max_size
    @get_max_size
  end
end

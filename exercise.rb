class Exercise
  def pick_random(stream)
    @result_map = {}
    stream.each do |el|
      exp = 0
      last_el = el
      while (@result_map["#{exp}"])
        last_el = [@result_map["#{exp}"], last_el].shuffle[0]
        @result_map.delete("#{exp}")
        exp += 1
      end
      @result_map["#{exp}"] = last_el
    end
    max_val = build_max_for(@result_map)
    find_in_range(@result_map, Random.rand(max_val) + 1)
  end

  def find_in_range(map,value_to_find)
    map.keys.sort.each do |k|
      value_to_find -= 2 ** k.to_s.to_i
      return map[k] if value_to_find <= 0
    end
  end

  def build_max_for(map)
    value = 0
    map.keys.each do |k|
      value += 2 ** k.to_s.to_i
    end
    value
  end

  def max_size
    @result_map.size
  end
end

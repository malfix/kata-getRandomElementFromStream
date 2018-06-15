class Exercise
  def initialize
  end

  def pick_random(*stream)
    #{'128': 1, '2': 2}
    result_map = {}
    stream.each do |el|
      exp=0
      while (result_map["#{exp}"])
        
        exp+=1
      end
      result_map["#{exp}"]
    end
  end
end

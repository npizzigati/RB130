class MyArray
  def initialize(arr)
    @arr = arr
  end

  def reduce2
    # puts "start: #{start}"
    accum = 0
    for e in @arr
      accum = yield(accum, e)
    end
    accum
  end

  def reduce(start = @arr[0])
    accum = start
    if start == @arr[0]
      start_index = 1
    else
      start_index = 0
    end
    for index in start_index..(@arr.size - 1)
      accum = yield(accum, @arr[index])
    end
    accum
  end
end

# a = MyArray.new([1, 2, 3])
# a.reduce { |accum, e| accum + e }
# MyArray.new(['a', 'b', 'c']).reduce { |acc, value| acc += value }     # => 'abc'
MyArray.new([[1, 2], ['a', 'b']]).reduce { |acc, value| acc + value } # => [1, 2, 'a', 'b']

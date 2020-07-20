class MyInteger
  def initialize(my_int)
    @my_int = my_int
  end

  def my_times
    for idx in 0..(@my_int - 1)
      yield(idx)
    end
    @my_int
  end
end

a = MyInteger.new(5)

a.my_times { |idx| puts "#{idx}: hello"}

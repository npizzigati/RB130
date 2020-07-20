class MyArray
  def initialize(arr)
    @arr = arr
  end

  def select
    new_arr = []
    for e in @arr
      if yield(e)
        new_arr << e
      end
    end
    new_arr
  end
end

a = MyArray.new([1, 2, 3, 4])
a.select { |e| e > 2 }

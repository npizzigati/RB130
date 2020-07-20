class MyArray
  def initialize(arr)
    @arr = arr
  end
   
  def my_each
    for e in @arr
      yield(e)
    end
    @arr
  end
end

a = MyArray.new([1, 2, 3])
a.my_each { |e| puts e + 2 }

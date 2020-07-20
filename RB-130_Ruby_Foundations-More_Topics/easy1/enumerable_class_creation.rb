class Tree
  include Enumerable

  def each
    for element in @elements
      yield(element)
    end
  end
end



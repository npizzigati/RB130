# Passing Parameters Part 3
# Given this code:

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end
# Fill out the following method calls for gather so that they
# produce the corresponding output shown in numbers 1-4 listed
# below:

# 1)

gather(items) do |*produce, grain|
  puts produce.join(', ')
  puts grain
end
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# 2)

gather(items) do |fruit, *veggies, grain|
  puts fruit
  puts veggies.join(', ')
  puts grain
end
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

# 3)

gather(items) do |fruit, *other|
  puts fruit
  puts other.join(', ')
end
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

# 4)

gather(items) do |item1, item2, item3, item4|
  puts "#{item1}, #{item2}, #{item3}, #{item4}"
end
# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!

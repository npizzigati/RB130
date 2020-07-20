# Find Missing Numbers
# Write a method that takes a sorted array of integers as an
# argument, and returns an array that includes all of the missing
# integers (in order) between the first and last elements of the
# argument.

# Approach: Identify the first and last elements of the
# array. Iterate integer by integer from first to last. At each
# iteration, if the integer is not contained in the array, add it
# to a results array.

def missing(arr)
  results = []
  first = arr.first
  last = arr.last
  (first..last).each do |integer| 
    results << integer unless arr.include? integer
  end
  results
end



# Examples:

missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []

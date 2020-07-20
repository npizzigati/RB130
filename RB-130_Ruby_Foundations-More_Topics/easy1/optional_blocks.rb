# Write a method that takes an optional block. If the block is
# specified, the method should execute it, and return the value returned
# by the block. If no block is specified, the method should simply
# return the String 'Does not compute.'.

# Examples:

# def compute
#   if block_given?
#     yield
#   else
#     'Does not compute.'
#   end
# end

# compute { 5 + 3 } == 8
# compute { 'a' + 'b' } == 'ab'
# compute == 'Does not compute.'

# Further Exploration
# Modify the compute method so it takes a single argument and
# yields that argument to the block. Provide at least 3 examples
# of calling this new version of compute, including a no-block
# call.

def compute_n_times(number)
  return 'Does not compute' unless block_given?
  yield(number)
end

compute_n_times(2) { |n| n * (5 + 3) }

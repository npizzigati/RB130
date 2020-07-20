# madeup_method is referenced here but not
# invoked so it doesn't matter if it exists or not
# my_proc = Proc.new { color }
my_proc = Proc.new { madeup_method }

# we then define a method called madeup_method

# color = 'blue'

def madeup_method
  puts 'Hello!'
end

# now when we call the Proc, madeup_method is invoked, outputting the
# String 'Hello!'
my_proc.call # => 'Hello!'

# Apparently, methods can be defined after the closure is created
# and the proc call will have access to them because they are
# in scope at the time the proc is called (not because they
# are in the binding of the closure).

# Why can a Proc call a method not in its binding (defined
# after the Proc is created), when it cannot access a variable
# with similar circumstances?

# Karl does not go into why this is in his answers to recent
# discussion questions, but he does mention that it does happen.

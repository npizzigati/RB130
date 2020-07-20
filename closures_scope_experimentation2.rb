# This works (i.e., it outputs "blue")

say_color = Proc.new {puts "The color is #{color}"}

def color
  "blue"
end

def call_chunk(code_chunk)
  code_chunk.call
end

call_chunk(say_color)

# While this doesn't (i.e. error because variable not found in
# binding):

say_color = Proc.new {puts "The color is #{color}"}

color = "blue"

def call_chunk(code_chunk)
  code_chunk.call
end

call_chunk(say_color)

# For this later one to work, we need to initialize the variable
# before the Proc is created for it to be in the binding.

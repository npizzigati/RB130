# Robot Name
# Write a program that manages robot factory settings.

# When robots come off the factory floor, they have no name.The
# first time you boot them up, a random name is generated, such
# as RX837 or BC811.

# Every once in a while we need to reset a robot to its factory
# settings, which means that their name gets wiped. The next time
# you ask, it will respond with a new random name.

# The names must be random: they should not follow a predictable
# sequence. Random names means a risk of collisions. Your
# solution should not allow the use of the same name twice when
# avoidable.

# Problem breakdown
# class Robot
# ===========
# method initialize()
# sets name as a random sequence of alphanumeric characters,
# two uppercase letters followed by three digits
# Approach: For the first two letters, choose a random digit by sampling from array of letters A-Z
# For three numbers sample from array of numbers 1-10
# ----------
# method reset()
# creates another name for robot

class Robot
  @@names_used = []

  attr_reader :name

  def initialize
    @name = nil
    set_name
  end

  def set_name
    candidate = nil

    loop do
      letter_part = ('A'..'Z').to_a.sample(2)
      number_part = (0..9).to_a.sample(3)
      candidate = (letter_part + number_part).join
      break unless @@names_used.include?(candidate)
    end

    @name = candidate
    @@names_used << @name
  end

  def reset
    set_name
  end

end

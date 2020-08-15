# Create a clock that is independent of date.

# You should be able to add and subtract minutes to it. Two
# clocks that represent the same time should be equal to each
# other.

# Classes:
# Clock
# Class methods:
# at(Integer hour, Integer minute)
# instantiates an object
# to_s
# Returns a string representation of time (see test suite)

class Clock
  MINUTES_IN_DAY = 24 * 60

  def initialize(hours, minutes)
    @minutes = (minutes + hours * 60) % MINUTES_IN_DAY
  end

  def self.at(hours, minutes = 0)
    new(hours, minutes)
  end

  def +(addend)
    new_minutes = (@minutes + addend) % MINUTES_IN_DAY
    self.class.new(0, new_minutes)
  end

  def -(subtrahend)
    new_minutes = @minutes - subtrahend
    new_minutes += MINUTES_IN_DAY until new_minutes > 0
    self.class.new(0, new_minutes)
  end

  def ==(other)
    self.to_s == other.to_s
  end

  def to_s
    hours, minutes = @minutes.divmod 60
    format('%.2<hours>d:%.2<minutes>d', hours: hours,
                                       minutes: minutes)
  end
end

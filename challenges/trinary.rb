#Implement a trinary number system converter

class Trinary
  BASE = 3

  def initialize(trinary_string)
    @trinary_string = trinary_string
  end

  def to_decimal
    return 0 if invalid?
    
    digits = @trinary_string.to_i.abs.digits
    result = 0
    digits.each_with_index do |digit, index|
      result += digit * (BASE**index)
    end
    negative? ? -result : result
  end

  def invalid?
    @trinary_string !~ /^-?[0-2]+$/
  end

  def negative?
    @trinary_string.start_with? == '-'
  end
end


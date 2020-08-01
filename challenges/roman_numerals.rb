# Roman Numerals
# The Romans were a clever bunch. They conquered most of Europe
# and ruled it for hundreds of years. They invented concrete and
# straight roads and even bikinis. One thing they never
# discovered though was the number zero. This made writing and
# dating extensive histories of their exploits slightly more
# challenging, but the system of numbers they came up with is
# still in use today. For example the BBC uses Roman numerals to
# date their programmes.

# The Romans wrote numbers using letters - I, V, X, L, C, D,
# M. (notice these letters have lots of straight lines and are
# hence easy to hack into stone tablets).

#  1  => I
# 10  => X
#  7  => VII
# There is no need to be able to convert numbers larger than
# about 3000. (The Romans themselves didn't tend to go any
# higher)

# Wikipedia says: Modern Roman numerals ... are written by
# expressing each digit separately starting with the left most
# digit and skipping any digit with a value of zero.

# To see this in practice, consider the example of 1990. In Roman
# numerals 1990 is MCMXC:

# 1000=M
# 900=CM
# 90=XC
# 2008 is written as MMVIII:

# 2000=MM
# 8=VIII
# See also: http://www.novaroma.org/via_romana/numbers.html

=begin

input: Integer (monkey patch Integer class)
output: String

requirements:
explicit:
- Output string should be the roman numeral of input integer
implicit:
- Have to monkey-patch Integer class?

rules:
- n=0 skip
- n=1-3 are simply that place numeral repeated n times
- n=4 is 1 x place numeral before D, V or L, as applicable (the
  next highest above decimal place)
- n=5 is D, V or L, as applicable
- n=6-8 are D, V or L + n-5 x numeral
- n=9 is 1 x place number before [MCX]

approach:
- Open Integer class and define #to_roman
- Define values of roman numerals (in hash?)
- initialize results array
- Iterate over digits (in reverse order). Unshift numerals to
  results array according to rules
- Join and return results

=end

class Integer
  def to_roman
    numerals = ([1000, 500, 100, 50, 10, 5, 1]).zip(%w[M D C L X V I])
                                  .to_h
    results = []
    place = 1
    self.digits.each do |digit|
      numeral = (numerals[place])
      five_numeral = (numerals[place * 5])
      next_higher_numeral = numerals[place * 10] if place <= 100
      case digit
      when 1..3
        results.unshift(numeral * digit)
      when 4
        results.unshift(numeral + five_numeral)
      when 5
        results.unshift(five_numeral)
      when 6..8
        results.unshift(five_numeral + (numeral * (digit - 5)))
      when 9
        results.unshift(numeral + next_higher_numeral)
      end
      place *= 10
    end
    results.join
  end
end

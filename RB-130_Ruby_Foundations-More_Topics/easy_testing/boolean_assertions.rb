# Write a minitest assertion that will fail if the value.odd? is
# not true.

require 'minitest/autorun'

class Odd_Test < Minitest::Test
  def test_odd
    value = 4
    assert_equal true, value.odd?
  end
end


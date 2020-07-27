require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(100)
    @transaction = Transaction.new(50)
  end

  def test_accept_money
    @transaction.amount_paid = 25
    @cash_register.accept_money(@transaction)

    expected = 125
    actual = @cash_register.instance_variable_get :@total_money
    assert_equal expected, actual
  end

  def test_calculate_change
    @transaction.amount_paid = 100
    expected = 50
    actual = @cash_register.change(@transaction)

    assert_equal expected, actual
  end

  def test_give_receipt
    @transaction.amount_paid = 50
    expected = /paid \$50/
    assert_output(expected) { @cash_register.give_receipt(@transaction) }
  end

end

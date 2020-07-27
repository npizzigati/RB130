require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(50)
  end

  def capture_output
    output = StringIO.new

    begin
      $stdout = output
      yield
    ensure
      $stdout = STDOUT
    end

    output.rewind
    output.read
  end

  def test_prompt_for_payment_correct_amount
    input = StringIO.new('50')
    output = capture_output { @transaction.prompt_for_payment(input: input) }

    refute_match(/full/, output)
  end

end

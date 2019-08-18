require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'cash_register'
require_relative 'transaction'
require 'stringio'

class CashRegisterTest < Minitest::Test
    def test_accept_money
        c = CashRegister.new(100)
        t = Transaction.new(20)
        t.amount_paid = 30

        previous_amount = c.total_money
        c.accept_money(t)
        current_amount = c.total_money
        assert_equal(previous_amount + 30, current_amount)
    end

    def test_change
        register = CashRegister.new(1000)
        transaction = Transaction.new(47)
        transaction.amount_paid = 55

        change = register.change(transaction)

        assert_equal(8, change)
    end

    def test_give_receipt
        item_cost = 55
        register = CashRegister.new(1000)
        transaction = Transaction.new(item_cost)
        transaction.amount_paid = 60

        assert_output("You've paid $#{item_cost}.\n") {|| register.give_receipt(transaction) }
    end
end


class TransactionTest < Minitest::Test
    
    def test_prompt_for_payment
        register = CashRegister.new(1000)
        transaction = Transaction.new(30)
        input = StringIO.new('30\n')
        
        capture_io { transaction.prompt_for_payment(input: input) }
        assert_equal(30, transaction.amount_paid)
    end
end
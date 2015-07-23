require_relative "../lib/calculator"
require "test/unit"

class TestCalculator < Test::Unit::TestCase

  def test_results()
    calc = Calculator.processor
    test_input = [
      "2 1 8 2 + 5 * + *",
      "+ 2 * 5 10",
      "1 2 + 4 * 5 + 3 -",
      "5 1 2 + 4 * + 3 -"
      ]

    assert_equal(102,calc.evaluate(test_input[0]), "Failed on: 2 1 8 2 + 5 * + *")
    assert_equal(52,calc.evaluate(test_input[1]), "Failed on: + 2 * 5 10")
    assert_equal(14,calc.evaluate(test_input[2]), "Failed on: 1 2 + 4 * 5 + 3 -")
    assert_equal(14,calc.evaluate(test_input[3]), "Failed on: 5 1 2 + 4 * + 3 -")
  end

end

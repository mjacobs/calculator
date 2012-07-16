require_relative 'postfixparser'
require_relative 'prefixparser'

module AdvCalc
  class Calculator
    
    def initialize
      
    end
    
    def evaluate_postfix(string)
      postfix_parser = AdvCalc::PostfixParser.new(string)
      postfix_parser.get_postfix_value
    end
    
    def evaluate_prefix(string)
      prefix_parser = AdvCalc::PrefixParser.new(string)
      prefix_parser.get_prefix_value
    end
    
  end
end

calc = AdvCalc::Calculator.new
puts calc.evaluate_postfix("2 1 8 2 + 5 * + *")
puts calc.evaluate_prefix("+ 2 * 5 10")
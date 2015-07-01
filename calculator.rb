# Copyright 2015 CalcTeam
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# Code to evaluate arithmetic expressions.
class Calculator

  def initialize
    # TODO: Support more operators
    @operands = ["+", "-", "*", "/"]
  end

  def evaluate(string)
    begin
      if @operands.include?(string[0])
        evaluate_prefix(string)
      else
        evaluate_postfix(string)
      end
    rescue => e
      puts "Error: Invalid input #{string}, message=#{e.message}"
      print e.backtrace.join("\n")
    end
  end

  def calculate(array)
    stack = []
    array.each do |item|
      if @operands.include?(item)
        if stack.size < 2
          raise "Invalid number of arguments for: #{item}"
        end
        v1 = stack.pop
        v2 = stack.pop
        stack.push(eval("#{v2} #{item} #{v1}"))
      else
        stack.push(item)
      end
    end
    if stack.size > 1
      raise "Invalid input"
    end
    return stack.pop
  end

  private
  def evaluate_postfix(string)
    array = string.split
    calculate(array)
  end

  def evaluate_prefix(string)
    array = string.split.reverse
    calculate(array)
  end
end

def test_result(calc, input, expected_result)
  actual = calc.evaluate(input)
  if actual == expected_result
    puts "Success: '#{input}' == '#{expected_result}'!"
  else
    puts "ERROR: input '#{input}' returned #{actual} but expected '#{expected_result}'!"
  end
end

calc = Calculator.new
test_result(calc, "2 1 8 2 + 5 * + *", 102)
test_result(calc, "+ 2 * 5 10", 52)
test_result(calc, "1 2 + 4 * 5 + 3 -", 14)
test_result(calc, "5 1 2 + 4 * + 3 -", 14)

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
    if @operands.include?(string[0])
      evaluate_prefix(string)
    else
      evaluate_postfix(string)
    end
  end

  def evaluate_postfix(string)
    array = string.split
    calculate(array)
  end

  def evaluate_prefix(string)
    array = string.split.reverse
    calculate(array)
  end

  def calculate(array)
    if array.length > 0
      array.each do |item|
        if @operands.include?(item)
          operate(array, item)
        end
      end
    end
    get_value(array)
  end

  private

  def operate(array, operand)
    index = array.find_index(operand)
    array[index - 2] = eval("#{array[index - 2].to_f} #{array[index]} #{array[index-1]}")
    array.delete_at(index)
    array.delete_at(index-1)
    calculate(array)
  end

  def get_value(array)
    array[0].to_i
  end

end

def test_result(calc, input, expected_result)
  if calc.evaluate(input) == expected_result
    puts "Success: '#{input}' == '#{expected_result}'!"
  else
    puts "ERROR: input '#{input}' does not equal expected result '#{expected_result}'!"
  end
end

calc = Calculator.new
test_result(calc, "2 1 8 2 + 5 * + *", 102)
test_result(calc, "+ 2 * 5 10", 52)

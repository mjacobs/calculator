module AdvCalc
  class PostfixParser
  
    def initialize(string)
      array_of_nums = string.split
      parser(array_of_nums)
    end
    
    def parser(array)
      @postfix_array = array
      if @postfix_array.length > 0
        @postfix_array.each do |item|
          case item
          when "+" then
            index = @postfix_array.find_index("+")
            @postfix_array[index-2] = @postfix_array[index-2].to_f + @postfix_array[index-1].to_f
            @postfix_array.delete_at(index)
            @postfix_array.delete_at(index-1)
            parser(@postfix_array)
          when "-" then
            index = @postfix_array.find_index("-")
            @postfix_array[index-2] = @postfix_array[index-2].to_f - @postfix_array[index-1].to_f
            @postfix_array.delete_at(index)
            @postfix_array.delete_at(index-1)
            parser(@postfix_array)
          when "*" then
            index = @postfix_array.find_index("*")
            @postfix_array[index-2] = @postfix_array[index-2].to_f * @postfix_array[index-1].to_f
            @postfix_array.delete_at(index)
            @postfix_array.delete_at(index-1)
            parser(@postfix_array)
          when "/" then
            index = @postfix_array.find_index("/")
            @postfix_array[index-2] = @postfix_array[index-2].to_f / @postfix_array[index-1].to_f
            @postfix_array.delete_at(index)
            @postfix_array.delete_at(index-1)
            parser(@postfix_array)
          end
        end
      end
    end
    
    def get_postfix_value
      @postfix_array[0].to_i
    end
    
  end  
end
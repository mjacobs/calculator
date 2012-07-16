module AdvCalc
  class PrefixParser
  
    def initialize(string)
      array_of_nums = string.split
      parser(array_of_nums)
      @valid_nums = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    end
    
    def parser(array)
      @array = array
      @length = @array.length
      while @length > 0
        @array.each do |item|
          case item
          when "+"
            index = @array.find_index("+")
            if (@valid_nums.include?(@array[index+1]) && @valid_nums.include?(@array[index+2]))  
              @array[index] = @array[index+1].to_f + @array[index+2].to_f
              @array.delete_at(index+2)
              @array.delete_at(index+1)
              parser(@array)
            end
          end
          when "-"
            index = @array.find_index("-")
            if (@valid_nums.include?(@array[index+1]) && @valid_nums.include?(@array[index+2]))              if (@valid_nums.include?(@array[item+1]) && @valid_nums.include?(@array[item+2]))
              @array[index] = @array[index+1].to_f - @array[index+2].to_f
              @array.delete_at(index+2)
              @array.delete_at(index+1)
              parser(@array)
            end
          end
          when "*"
            index = @array.find_index("*")
            if (@valid_nums.include?(@array[index+1]) && @valid_nums.include?(@array[index+2]))              if (@valid_nums.include?(@array[item+1]) && @valid_nums.include?(@array[item+2]))            
              @array[index] = @array[index+1].to_f * @array[index+2].to_f
              @array.delete_at(index+2)
              @array.delete_at(index+1)
              parser(@array)
            end
          end
          when "/"
            index = @array.find_index("/")
            if (@valid_nums.include?(@array[index+1]) && @valid_nums.include?(@array[index+2]))  
              @array[index] = @array[index+1].to_f / @array[index+2].to_f
              @array.delete_at(index+2)
              @array.delete_at(index+1)
              parser(@array)
            end
          end
        end
      end
    end
    
    def get_prefix_value
      @array[0].to_i
    end
    
  end  
end
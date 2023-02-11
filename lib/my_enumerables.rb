module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    for x in self
      yield(x,i)
      i+=1
    end
  end

  def my_select(&block)
    output_arr = []
    for x in self
      output_arr.push(x) if (yield x)
    end
    output_arr
  end

  def my_all?
    for x in self
      (return false) unless yield x
    end
    true
  end

  def my_any?
    for x in self
      (return true) if yield x
    end
    false
  end

  def my_none?(&passed_block)
    (!(self.my_any?(&passed_block))) ? (return true) : (return false)
  end

  def my_count(&passed_block)
    (return self.length) unless block_given?
    
    return (self.my_select(&passed_block)).length
  end

  def my_map(&passed_block)
    output_arr = []
    for x in self
      output_arr.push(yield x)
    end
    output_arr
  end

  def my_inject(_initial_value = 0)
    for i in self
      _initial_value = yield(_initial_value, i)
    end
    _initial_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each()
    for x in self
      yield x
    end
  end
end


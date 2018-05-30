def sum_to(n)/Users/Matt/Desktop/homework/HWRKW1D3/recursion.rb
  return 1 if n == 1
  return nil if n < 1
  sum_to(n-1) + n
end

def add_numbers(nums_array)
  return nums_array[0] if nums_array.size <= 1
  nums_array[0] + add_numbers(nums_array[1..-1])
end

def gamma_fnc(n)
  return nil if n.zero?
  return 1 if n == 1 || n == 2
  debugger
  (n - 1) * gamma_fnc(n - 1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return true if flavors[0] == favorite
  ice_cream_shop(flavors[1..-1], favorite)
end

def reverse(string)
  return "" if string.empty?
  return string if string.length == 1
  string[-1] + reverse(string[0...-1])
end

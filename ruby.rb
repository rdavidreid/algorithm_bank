def digitalRoot(arg)
  return arg if arg < 10
  return digitalRoot((arg % 10) + (arg / 10))
end

def fizbuz(arr)
  ans = []
  arr.each do |el|
    if el % 3 == 0 && el % 5 == 0
      ans += "fizzbuzz"
    elsif
    end
  end

end

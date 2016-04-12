def digitalRoot(arg)
  return arg if arg < 10
  return digitalRoot((arg % 10) + (arg / 10))
end

def fizzbuzz(arr)
  ans = []
  arr.each do |el|
    if el % 3 == 0 && el % 5 == 0
      ans.push("fizzbuzz")
    elsif el % 3 == 0
      ans.push("fizz")
    elsif el % 5 == 0
      ans.push("buzz")
    else
      ans.push(el)
    end
  end
  ans
end

# Cracking Code Interview 1.1

def my_uniq(str)
  letters = Hash.new(false)
  str.each_char do |chr|
    return false if letters[chr]
    letters[chr] = true
  end
  true
end

# Cracking Code Interview 1.3

def is_perm?(str1,str2)
  my_hash = Hash.new(0)
  str1.each_char do |chr|
    my_hash[chr] += 1
  end
  str2.each_char do |chr|
    my_hash[chr] -= 1
  end
  my_hash.each do |_, value|
    return false if value != 0
  end
  true
end

# is_perm?("cat", "bat")
# is_perm?("cat", "atc")

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

# Crackig Code Interview 1.5
def my_compress(str)
  ans = ""
  count = 1
  prev = str[0]
  idx = 1
  while idx <= str.length
    if prev == str[idx]
      count += 1
    else
      ans += count.to_s
      ans += prev
      count = 1
    end
    prev = str[idx]
    idx += 1
  end
  # puts "ans: #{ans.length} #{ans}"
  # puts "str: #{str.length} #{str}"
  ans.length < str.length ? ans : str
end

# my_compress("davvawidddddddd")
# my_compress("davvawidddddd")


# Crackig Code Interview 1.6
# stationary:
def my_rotate(arr)
  row_length = arr.length
  col_length = arr[0].length
  ans = []
  (0...col_length).each do |col|
    ans[col] ||= []
    (0...row_length).each do |row|
      new_row = col_length - col - 1
      ans[col] << arr[row][new_row]
    end
  end
  ans
end

# Crackig Code Interview 1.7

def row_col_zero(arr)
  rows_to_zero = []
  cols_to_zero = []
  arr.each_with_index do |row, row_idx|
    row.each_with_index do |el, col|
      if el == 0
        cols_to_zero << col
        rows_to_zero << row_idx
      end
    end
  end
  rows_to_zero.each do |row|
    arr[row].map! {|el| el = 0}
  end
  cols_to_zero.each do |col|
    arr.each do |row|
      row[col] = 0
    end
  end
  arr
end

# Crackig Code Interview 1.8
def check_rotation(str1,str2)
  str1.is_substring?(str2 * 2)
end

class String
  def is_substring?(str)
    str.include?(self)
  end
end

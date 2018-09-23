def nine_pandigital?(num)
  arr = num.to_s.split('')
  return false if arr.length != 9
  dict = Hash.new
  arr.each do |n|
    if dict[n] || n == '0'
      return false
    end
    dict[n] = true
  end
  true
end

def main
  max_found = 1
  (1..10000).each do |num|
    (2..9).each do |len|
      concat_num = [*1..len].map { |n| (n * num).to_s }.join.to_i
      max_found = concat_num if nine_pandigital?(concat_num) && concat_num > max_found
    end
  end
  max_found
end

puts(main)


def triangle_number(num)
  (num * (num + 1)) / 2
end

def populate_triangle_numbers(top)
  (1..top).map { |i| [triangle_number(i), true] }.to_h
end

def num_count(letter)
  [*'A'..letter].length
end

def main(arr)
  triang_nums = populate_triangle_numbers(200)
  count = 0
  arr.each do |word|
    word_value = word.split('').map { |l| num_count(l) }.sum
    count += 1 if triang_nums[word_value]
  end

  count
end

#---------------------------------------------------------------------------------------------------

euler_input = File.read('./problem_input_txt/042_words.txt').gsub!(/\W+/, ' ').strip.split(' ')

puts(main(euler_input))

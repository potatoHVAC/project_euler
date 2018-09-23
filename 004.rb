# coding: utf-8
# Largest Palindrome Product
#---------------------------------------------------------------------------------------------------
#A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
#
#Find the largest palindrome made from the product of two 3-digit numbers.
#---------------------------------------------------------------------------------------------------
# Running main will return the answer.

def is_palendrome?(num)
  num_arr = num.to_s.split('')
  len = num_arr.length
  num_arr[0..len/2] == num_arr.reverse[0..len/2]
end

def main
  max_found = 0
  (100...1000).each do |i|
    (i...1000).each do |j|
      prod = i*j
      max_found = prod if prod > max_found && is_palendrome?(prod)
    end
  end

  max_found
end

puts(main)

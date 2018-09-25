# coding: utf-8
# Problem 006: Sum Square Difference
#---------------------------------------------------------------------------------------------------
# The sum of the squares of the first ten natural numbers is,
# 12 + 22 + ... + 102 = 385
# 
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)2 = 552 = 3025
#
# Hence the difference between the sum of the squares of the first ten natural numbers
# and the square of the sum is 3025 − 385 = 2640.
#
# Find the difference between the sum of the squares of the first one hundred natural
# numbers and the square of the sum.
#---------------------------------------------------------------------------------------------------
#
# main(<input>)
#   <input> positive integer
#   outpus the difference between the sum of the squares of 1 to <input> and the square of their sum
#

def main(top)
  square_sums = (1..top).sum**2
  sum_squares = (1..top).map { |i| i**2 }.sum
  square_sums - sum_squares
end

#---------------------------------------------------------------------------------------------------

euler_input = 100
puts main(euler_input) 

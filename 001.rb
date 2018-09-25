# Problem 001: Multiples of 3 and 5
#---------------------------------------------------------------------------------------------------# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
# The sum of these multiples is 23.
# 
# Find the sum of all the multiples of 3 or 5 below 1000.
#---------------------------------------------------------------------------------------------------
# main(<input>)
#   <input> positive integer
#   outputs the sum of al the multiples of 3 or 5 below <input>

def main(upper_bound)
  (1..upper_bound).select { |i| i % 3 == 0 || i % 5 == 0 }.sum
end

#---------------------------------------------------------------------------------------------------

euler_input = 1000
puts main(euler_input)



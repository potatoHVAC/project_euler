# Problem 010: Summation of primes
#---------------------------------------------------------------------------------------------------
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.
#---------------------------------------------------------------------------------------------------
#
# main(<input>)
#   <input> positive integer
#   outputs the sum of all primes below <input>
#

require './helper_prog/primes_class.rb'

def main(top)
  Primes.new(top).lst.sum
end

#---------------------------------------------------------------------------------------------------

euler_input = 2 * 10**6
puts main(euler_input)

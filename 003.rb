# Problem 003: Largest prime factor
#---------------------------------------------------------------------------------------------------
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?
#---------------------------------------------------------------------------------------------------
# main(<input>)
#   <input> positive integer
#   outputs the largest prime factor of <input>
#

def main(num)
  (2..num).each do |i|
    num = num / i while num % i == 0
    return i if num < i
  end
end

#---------------------------------------------------------------------------------------------------

euler_input = 600851475143
puts main(euler_input)

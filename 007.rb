# Problem 007: 10001st prime
#---------------------------------------------------------------------------------------------------
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the
# 6th prime is 13.
#
# What is the 10 001st prime number?
#---------------------------------------------------------------------------------------------------
#
# main(<input>)
#   <input> positive integer
#   outputs the prime number thats the <input> smallest
#
# is_prime(<input>)
#   <input> integer
#   outputs true if <input> is prime, else false
#

def is_prime(num)
  (2..num**0.5).each { |i| return false if num % i == 0 }
  true
end

def main(top)
  count = 0
  i = 1
  while i += 1
    count += 1 if is_prime(i)
    return i if count == top
  end
end

#---------------------------------------------------------------------------------------------------

euler_input = 10001
puts main(euler_input)

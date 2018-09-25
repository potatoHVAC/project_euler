# Problem 009: Special Pythagorean triplet
#---------------------------------------------------------------------------------------------------
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a**2 + b**2 = c**2
#
# For example, 32 + 42 = 9 + 16 = 25 = 52.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
#---------------------------------------------------------------------------------------------------
#
# main(<input>)
#   <input> positive integer
#   outputs a*b*c of a pythagorean triplet thats sum == <input>
#
# is_pythag?(<inputs>)
#   <inputs> three seperate positive integers
#   outputs true if <inputs> are a pythagorean triplet, else false
#

def is_pythag?(a,b,c)
  return false if [a,b,c].include?(0)
  a**2 + b**2 == c**2
end

def main(target)
  (1 .. target / 3).each do |a|
    (1 ... target / 2).each do |b|
      c = target - a - b
      return a * b * c if is_pythag?(a, b, c)
    end
  end
end

#---------------------------------------------------------------------------------------------------

euler_input = 1000
puts(main(euler_input))
    

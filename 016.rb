# Problem 016: Power Diget Sum
#---------------------------------------------------------------------------------------------------
# 2**15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
# What is the sum of the digits of the number 2**1000?
#---------------------------------------------------------------------------------------------------
#
# pwr_sum(pwr)
#   <pwr> positive integer
#   outputs sum of all digetes in 2**<pwr>
#

def pwr_sum(pwr)
  (2**pwr).to_s.split('').map(&:to_i).sum
end

#---------------------------------------------------------------------------------------------------

euler_input = 1000
puts(pwr_sum(euler_imput))

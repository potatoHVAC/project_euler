# Multiples of 3 and 5
#---------------------------------------------------------------------------------------------------
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.
#---------------------------------------------------------------------------------------------------
# Entering <upper_bound> into main will count all 3's and 5's below <upper_bound> 

def main(upper_bound)
  total = 0

  for i in 0...upper_bound do
    if i % 3 == 0 || i % 5 == 0
      total += i
    end
  end

  return total
end


puts main(1000)

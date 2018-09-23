# Sum Square Difference
#---------------------------------------------------------------------------------------------------


def main(top)
  square_sums = (1..top).sum**2
  sum_squares = (1..top).map { |i| i**2 }.sum
  square_sums - sum_squares
end

puts(main(100))

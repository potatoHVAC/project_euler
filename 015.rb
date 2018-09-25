# coding: utf-8
# Problem 015: Lattice Paths
#---------------------------------------------------------------------------------------------------
# Starting in the top left corner of a 2×2 grid, and only being able to move to the
# right and down, there are exactly 6 routes to the bottom right corner.
#
# How many such routes are there through a 20×20 grid?
#---------------------------------------------------------------------------------------------------
#
# main(size)
#   <size> integer representing the length of the grid sides
#   outputs the number of routes through the grid
#
# sum_neighbors(row)
#   <row> array representing row in pythagorean striangle
#   outputs an array with the next row in the pythagorean triangle

def sum_neighbors(row)
  new_row = Array.new(row.length + 1, 1)
  (1...row.length).each do |i|
    new_row[i] = row[i] + row[i - 1]
  end
  new_row
end

def main(size)
  row = [1]
  (size * 2).times { row = sum_neighbors(row) }
  row[size]
end

#---------------------------------------------------------------------------------------------------

euler_input = 20
puts(main(euler_input))


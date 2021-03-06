# coding: utf-8
# Problem 011: Largest Product in a Grid
#---------------------------------------------------------------------------------------------------
# In the 20×20 grid below, four numbers along a diagonal line have been marked in red.
#
# <see input at bottom>
#                                                                                  
# The product of these numbers is 26 × 63 × 78 × 14 = 1788696.
#
# What is the greatest product of four adjacent numbers in the same direction
# (up, down, left, right, or diagonally) in the 20×20 grid?
#---------------------------------------------------------------------------------------------------
#
# main(<input_matrix>, <input_length>)
#   <input_matrix> 2D array of integers
#   <input_length> the length of consecutive numbers to compare
#     * length must be less than or equal to matrix height and width
#   outputs the maximum sum of <input_length> adjecent numbers in the <input_matrix> 
#
# horizontal_line(row, col, matrix, row_len, line_len)
#   <row> integer for row
#   <col> integer for column
#   <matrix> the matrix to check
#   <row_len> integer for length of row
#   <line_len> integer for number of adjecent integers to chec
#   outputs the product of <line_len> adjacent integers from position(<row>, <col>) horizontally to the right, returns zero if line goes out of bounds
#
# vertical_line(row, col, matrix, col_len, line_len)
#   <row> integer for row
#   <col> integer for column
#   <matrix> the matrix to check
#   <col_len> integer for length of row
#   <line_len> integer for number of adjecent integers to check
#   outputs the product of <line_len> adjacent integers from position(<row>, <col>) vertically down, returns zero if line goes out of bounds
#
# slash_line(row, col, matrix, col_len, line_len)
#   <row> integer for row
#   <col> integer for column
#   <matrix> the matrix to check
#   <col_len> integer for length of row
#   <line_len> integer for number of adjecent integers to check
#   outputs the product of <line_len> adjacent integers from position(<row>, <col>) down and to the left, returns zero if line goes out of bounds
#
# back_slash_line(row, col, matrix, row_len, col_len, line_len)
#   <row> integer for row
#   <col> integer for column
#   <matrix> the matrix to check
#   <row_len> integer for length of row
#   <col_len> integer for length of row
#   <line_len> integer for number of adjecent integers to check
#   outputs the product of <line_len> adjacent integers from position(<row>, <col>) down and to the right, returns zero if line goes out of bounds
#
# max_for_pos(row, col, matrix, row_length, col_length, line_length)
#   <row> integer for row
#   <col> integer for column
#   <matrix> the matrix to check
#   <row_length> integer for length of row
#   <col_length> integer for length of row
#   <line_length> integer for number of adjecent integers to check
#   outputs the maximum of the 4 possible lines from the position(<row>, <col>)
#

def horizontal_line(row, col, matrix, row_len, line_len)
  return 0 if col > row_len - line_len
  (0...line_len).inject(1) { |tot, i| matrix[row][col + i] * tot }
end

def vertical_line(row, col, matrix, col_len, line_len)
  return 0 if row > col_len - line_len
  (0...line_len).inject(1) { |tot, i| matrix[row + i][col] * tot }
end

def slash_line(row, col, matrix, col_len, line_len)
  out_of_bounds = col < line_len - 1 || row > col_len - line_len
  return 0 if out_of_bounds
  (0...line_len).inject(1) { |tot, i| matrix[row + i][col - i] * tot }
end

def back_slash_line(row, col, matrix, row_len, col_len, line_len)
  out_of_bounds = col > row_len - line_len || row > col_len - line_len
  return 0 if out_of_bounds
  (0...line_len).inject(1) { |tot, i| matrix[row + i][col + i] * tot }
end

def max_for_pos(row, col, matrix, row_length, col_length, line_length)
  [
    horizontal_line(row, col, matrix, row_length, line_length),
    vertical_line(row, col, matrix, col_length, line_length),
    slash_line(row, col, matrix, col_length, line_length),
    back_slash_line(row, col, matrix, row_length, col_length, line_length)
  ].max
end

def main(input_matrix, line_length)
  row_length = input_matrix[0].length
  col_length = input_matrix.length
  max_found = nil
  
  (0...row_length).each do |row_i|
    (0...col_length).each do |col_i|
      check_position = max_for_pos(row_i, col_i, input_matrix, row_length, col_length, line_length)
      max_found = [max_found, check_position].compact.max
    end
  end

  max_found
end

#---------------------------------------------------------------------------------------------------

euler_input = '''
08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08
49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00
81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65
52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91
22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80
24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50
32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70
67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21
24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72
21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95
78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92
16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57
86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58
19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40
04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66
88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69
04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36
20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16
20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54
01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48
'''.strip.split("\n").map { |row| row.split(' ').map(&:to_i) }

puts main(euler_input, 4)

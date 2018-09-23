
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

euler_input = 20
puts(main(euler_input))


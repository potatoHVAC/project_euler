class TriangleNumbers

  def initialize(target)
    @target_divisor_count = target
    @index = 0
    @t_num = 0
    @max_found = [0, 0, 0] # index, t_num, divisor_count
  end

  def solve
    nxt_triangle_number while not_solved?
    self
  end

  def is_square?(num)
    Math.sqrt(num).floor**2 == num
  end
  
  def count_divisors(num)
    count = 0
    top = Math.sqrt(num)
    (1..top).each { |n| count += 2 if num % n == 0 }
    count -= 1 if is_square?(num)
    count
  end
  
  def nxt_triangle_number
    @index += 1
    @t_num += @index
    divisor_count = count_divisors(@t_num)
    compare_to_last_max(divisor_count)
    puts(self.to_s + '::' + @index.to_s) if @index % 100 == 0
  end

  def compare_to_last_max(num)
    @max_found = [@index, @t_num, num] if num > @max_found[2]
  end

  def not_solved?
    @max_found[2] < @target_divisor_count
  end

  def to_s
    strings = @max_found.map(&:to_s)
    strings[0] + ': ' + strings[1] + ' -> ' + strings[2]
  end
end

puts(TriangleNumbers.new(500).solve)

require 'set'

class PentagonalNumbers

  attr_accessor :pent_lst, :pent, :pass_lst

  def initialize(size)
    @size = size

    @pent_set = [*1..size].to_set
    @pent_prod_set = Set.new
    @pent_diff_set = Set.new
    
    @pass_lst = []
    @pass_min = 0
  end

  def main(target_len = 1)

  end

  def pentagonal(i)
    i * (3*i - 1) / 2
  end

  def pentagonal_prod(i1, i2)
    pentagonal(i1) * pentagonal(i2)
  end

  def petagonal_diff(i1, i2)
    pentagonal(i2) - pentagonal(i1)
  end

  def is_pentagonal?(num)
    a = 1.5
    b = -0.5
    c = -num

    quadratic = -b 
  end
end

def t1
  pentagonal_numbers = PentagonalNumbers.new(100)
  pentagonal_numbers.main(1)
  p pentagonal_numbers.pent_lst
end
t1

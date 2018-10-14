require 'set'

class PentagonalNumbers

  attr_accessor :pent_lst, :pent, :pass_lst

  def initialize(size)
    @size = size
    @pent_lst = [*1..size].map { |i| i * (3*i - 1) / 2 }
    @pent = @pent_lst.to_set

    @pass_lst = []
    @pass_min = 0
  end

  def main(target_len = 1)
    check_lst
    while @pass_lst.length < target_len
      increase_size
      check_lst
    end
    
    @pass_min
  end

  def check_lst
    @pent_lst.each_with_index do |p1, i|
      @pent_lst[(i + 1)..-1].each do |p2|        
        if pentagonal_product?(p1, p2) && pentagonal_diff?(p1, p2)
          @pass_lst.append(p2 - p1)
          @pass_min = p2 - p1 if p2 - p1 < @pass_min
        end
      end
    end
  end

  def increase_size
    @new_pent_lst = [*(@size + 1) .. @size * 2]
    @size *= 2
    @pent_lst += @new_pent_lst
    @pent += @new_pent_lst.to_set
  end

  def pentagonal_product?(pent1, pent2)
    @pent.include?(pent1 * pent2)
  end

  def pentagonal_diff?(pent1, pent2)
    @pent.include?(pent2 - pent1)
  end
end

def t1
  pentagonal_numbers = PentagonalNumbers.new(100)
  pentagonal_numbers.main(1)
  p pentagonal_numbers.pent_lst
end
t1

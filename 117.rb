

class Board

  attr_accessor :target, :tiles, :data
  
  def initialize(tiles, target)
    @target = target
    @tiles = tiles
    @data = Array.new(target + 1, [])
    @data[0] = ['']
  end

  def find_combinations
    @tiles.each do |tile|
      (0 .. (@target - tile)).each do |i|
        @data[tile + i] += @data[i].map { |set| set + tile.to_s } 
      end
    end

    self
  end

  def fact(n)
    (1..n).reduce(1, :*)
  end
  
  def permutation_equation(set)
    total_permutations = fact(set.length)
    
    tile_count_in_set = @tiles.map { |t| set.split('').count(t.to_s) }
    adjust_for_duplicate = tile_count_in_set.map { |c| fact(c) }.reduce(:*)
    
    total_permutations / adjust_for_duplicate
  end
  
  def calculate_unique_permutations
    @data[-1].inject(0) { |tot, set| tot + permutation_equation(set) }
  end
  
  def main
    self.find_combinations
    calculate_unique_permutations
  end
end

euler_tile_input = [*1..4]
euler_board_size = 50
p Board.new(euler_tile_input, euler_board_size).main



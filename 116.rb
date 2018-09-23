

class Board

  attr_accessor :target, :tiles, :data
  
  def initialize(tiles, target)
    @target = target
    @tiles = tiles
    @unique_sets = []
  end

  def find_combinations
    @tiles[1..-1].each do |tile|
      (1 .. (@target / tile)).each do |i|
        black_tiles = '1' * (@target - tile * i)
        color_tiles = tile.to_s * i
        @unique_sets << black_tiles + color_tiles
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
    @unique_sets.inject(0) { |tot, set| tot + permutation_equation(set) }
  end
  
  def main
    self.find_combinations
    calculate_unique_permutations
  end
end

euler_tile_input = [*1..4]
euler_board_size = 50
p Board.new(euler_tile_input, euler_board_size).main



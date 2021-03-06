
class Coins

  def initialize(target, coins)
    @target = target
    @counts = Array.new(target + 1, 0)
    @counts[0] = 1
    @coins = coins
  end

  def add_coin(coin)
    @counts.each_with_index do |count, i|
      sum = i + coin
      if sum <= @target
        @counts[sum] += count
      end
    end
  end

  def solve
    @coins.each { |c| add_coin(c) }
    @counts[@target]
  end
end

print(Coins.new(200, [1,2,5,10,20,50,100,200]).solve)

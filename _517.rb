def is_prime?(num)
  (2..num**0.5).each { |i| return false if num % i == 0 }
  true
end

class Game

  def initialize(a)
    @a = a**0.5
    @start = a
    @dict = {}
  end
  
  def g(x = @start)
    return 1 if x < @a
    g(x-1) + g(x-@a)
  end
end

#def main(start, stop)
#  mod = 1000000007
#  (start+1...stop).select {|n| n if is_prime?(n) }.map { |n| big_g(n) % mod }.sum
#end

(1...100).each { |i| puts(Game.new(i).g) if is_prime?(i)}

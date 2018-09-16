class Collatz

  def initialize(max)
    @max = max
    @dict = {"1" => 1}
    @max_i = 1
  end

  def main
    for i in 2..@max
      @dict[i.to_s] = fill_in_collatz(i)
      @max_i = i if @dict[i.to_s] > @dict[@max_i.to_s]
    end

    @max_i
  end

  def fill_in_collatz(i)
    return @dict[i.to_s] if @dict[i.to_s]
    nxt = nxt_collatz(i)
    @dict[nxt.to_s] = fill_in_collatz(nxt)
    @dict[nxt.to_s] + 1
  end

  def nxt_collatz(num)
    num.even? ? num / 2 : num * 3 + 1
  end
end

a = Collatz.new(1000000)
puts(a.main)

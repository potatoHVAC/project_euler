class Permutations

  def initialize(arr)
    @arr = arr
  end

  def perm(arr = @arr)
    return [arr] if arr.length <= 1
    set = []
    (0...arr.length).each do |i|
      ele = arr[i]
      remaining_arr = arr[0...i] + arr[i+1...arr.length]
      set += perm(remaining_arr).map { |a| a.unshift(ele) }
    end

    set
  end
end

def is_prime?(num)
  (2..num**0.5).each { |n| return false if num % n == 0 }
  true
end

def main(arr)
  permutations = Permutations.new(arr.sort.reverse).perm.map do |a|
    a.map(&:to_s).join.to_i
  end
  permutations.each { |num| return num if is_prime?(num)}
  main(arr.sort[0..-2])
end

p(main([*1..9]))

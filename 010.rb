
def is_prime?(num)
  (2..num**0.5).each { |i| return false if num % i == 0 }
  true
end

def main(top)
  (1 ... top).inject(0) { |tot, i| is_prime?(i) ? tot + i : tot }
end

puts main(2 * 10**6)

def is_prime?(num)
  (2..num**0.5).each { |i| return false if num % i == 0 }
  true
end

(2...10_000_000).each {|i| puts i if is_prime?(i) }

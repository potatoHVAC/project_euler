

def is_prime(num)
  (2..num**0.5).each { |i| return false if num % i == 0 }
  true
end

def main(top)
  count = 0
  i = 1
  while i += 1
    count += 1 if is_prime(i)
    return i if count == top
  end
end

p(main(10001))

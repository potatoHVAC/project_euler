
def is_prime(num, check=2)
  return true if num == 2
  return false if num % check == 0
  return true if check**2 > num
  is_prime(num, check + 1)
end

def main()
  max = 2000000
  total = 0
  for i in 2...max
    total += i if is_prime(i)
  end

  total
end

puts main

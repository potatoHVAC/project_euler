def is_prime?(n)
  (2..n**0.5).each { |i| return false if n%i == 0 }
  true
end

def populate_primes(max)
  primes = []
  (2..max).each { |i| primes.append(i) if is_prime?(i)}
  primes
end

def populate_set(arr)
  hash = Hash.new
  arr.each { |p| hash[p.to_s] = true }
  hash
end

def factor_count(num, prime_arr, prime_set)
  count = Hash.new(0)
  prime_arr.each do |prime|
    while num % prime == 0
      count[prime.to_s] += 1
      num /= prime
    end

    return count.length + 1 if prime_set[num]
    return count.length if num == 1
  end
end

def main(top)
  prime_arr = populate_primes(top)
  prime_set = populate_set(prime_arr)

  count = 0
  (40..top).each do |n|
    factor_count(n, prime_arr, prime_set) == 4 ? count += 1 : count = 0
    return n - 3 if count == 4
  end

  'range too short'
end

puts(main(1000000))

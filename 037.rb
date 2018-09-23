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

def truncatable?(num, prime_set)
  num_arr = num.to_s.split('')
  return false if num_arr.include?('0')
  truncatable_r?(num_arr, prime_set) && truncatable_l?(num_arr, prime_set)
end

def truncatable_r?(num_arr, prime_set)
  arr = num_arr.dup
  while arr.any?
    return false unless prime_set[arr.join]
    arr.pop
  end
  true
end

def truncatable_l?(num_arr, prime_set)
  arr = num_arr.dup
  while arr.any?
    return false unless prime_set[arr.join]
    arr.shift
  end
  true
end

def main(top)
  prime_set = populate_set(populate_primes(top))
  truncatable_primes = []
  (11..top).each do |num|
    if prime_set[num.to_s] && truncatable?(num, prime_set)
      truncatable_primes.append(num)
    end

    return truncatable_primes if truncatable_primes.length == 11
  end

  truncatable_primes
end

p(main(1000000).sum)

  

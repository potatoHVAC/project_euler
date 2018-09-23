
def is_prime?(num)
  (2..num**0.5).each { |i| return false if num % i == 0 }
  true
end

def populate_primes(top)
  (2..top).select { |i| i if is_prime?(i) }
end

def arr_to_hash(arr)
  arr.map { |i| [i, true] }.to_h
end

def is_composit?(num, prime_lst)
  return false if num % 2 == 0
  second = false
  prime_lst.each do |prime|
    while num % prime == 0
      return true if second
      second = true
      num /= prime
    end

    return false if prime > num
  end
end

def perfect_square?(num)
  num == (num**0.5).floor**2
end

def not_christian_goldbach?(num, prime_lst)
  prime_lst.each do |prime|
    i = (num - prime) / 2
    return true if i < 0
    return false if perfect_square?(i)
  end
end

def main(top)
  odd_primes = populate_primes(top)[1..-1]
  (9...odd_primes[-1]).each do |i|
    if is_composit?(i, odd_primes) && not_christian_goldbach?(i, odd_primes)
      return i
    end
  end
  
  'not in range'
end

p main(10**4)


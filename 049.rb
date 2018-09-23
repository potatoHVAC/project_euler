require 'set'

def is_prime?(n)
  (2..n**0.5).each { |i| return false if n%i == 0 }
  true
end

def populate_primes(min, max)
  primes = Set.new
  (min..max).each { |i| primes.add(i) if is_prime?(i)}
  primes
end

def check_prime_set(arr)
  arr.each_with_index do |a, ai|
    arr[ai+1..-1].each_with_index do |b, bi|
      arr[bi+1..-1].each do |c|
        return [a,b,c] if b-a == c-b
      end
    end
  end
  
  nil
end

def main
  prime_set = populate_primes(10**3, 10**4)
  prime_dict = {}

  prime_set.each do |prime|
    arr = prime.to_s.split('').sort
    prime_dict[arr] = [] unless prime_dict[arr]
    prime_dict[arr].append(prime)
  end

  ans = []
  prime_dict.each_value { |v| ans.append(check_prime_set(v)) if v.length > 2}
  ans.compact
end

p(main)


  

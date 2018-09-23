class Primes

  def initialize(top)
    @primes = populate_primes(top)
  end

  def prime?(n)
    (2..n**0.5).each { |i| return false if n % i == 0 }
    true
  end
  
  def populate_primes(top)
    primes = {}
    (2..top).each { |i| primes[i] = true if prime?(i) }
    primes
  end

  def include?(num)
    @primes[num]
  end

  def not_include?(num)
    @primes[num] == nil
  end
end

def quad(a, b, n)
  n**2 + a * n + b
end

def prime_lst_len(a, b, prime_set)
  (0..b.abs).each { |n| return n if prime_set.not_include?(quad(a, b, n))}
end

def main(a_max, b_max)
  prime_set = Primes.new(b_max**2 + b_max*(a_max + 1))
  p 'Primes done'

  max_count = 0
  ab = []

  p prime_lst_len(a_max, b_max, prime_set)
#  (-(a_max + 1)...a_max).each do |ai|
#    (-b_max..b_max).each do |bi|
#      if prime_set_include?(bi)
#        count = prime_lst_len(ai, bi, prime_set)
end

main(-79, 1601)

        
    

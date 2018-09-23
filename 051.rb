require 'set'

class PrimeFun

  attr_reader :primes

  def initialize(top)
    @primes = populate_primes(top)
    @highest = Set.new
  end

  def populate_primes(num)
    primes = Set.new
    (2..num).each { |i| primes.add(i) if is_prime?(i)}
    primes
  end

  def is_prime?(n)
    (2..n**0.5).each { |i| return false if n%i == 0 }
    true
  end

  def solve_replacements
    @primes.each { |p| check(p)}
    @highest
  end

  def check(num)
    num_str = num.to_s
    ('0'..'9').each do |target|
      prime_family = Set.new
      ('0'..'9').each do |rep|
        replaced_num = num_str.tr(target, rep).to_i
        if @primes.include?(replaced_num) && num_str.length == replaced_num.to_s.length
          prime_family.add(replaced_num)
        end
      end

      @highest = prime_family.dup if prime_family.length > @highest.length
    end    
  end
end

puts PrimeFun.new(1000000).solve_replacements



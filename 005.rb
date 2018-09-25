# Problem 005: Smallest Multiple
#---------------------------------------------------------------------------------------------------
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without
# any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
#---------------------------------------------------------------------------------------------------
#
# main(<input>)
#   <input> a positive integer
#   outputs the smallest number divisible by all numbers between 1 and <input>
#
# increase_counts(<input_source>, <input_new>)
#   <inputs> two Hashmaps
#      * key=_ value=integer
#   outpus one Hashmap that is the combination of the inputs
#
# prime_factors(<input>)
#   <input> integer > 2
#   outputs a Hashmap of the count of all prime factors of <input>
#     * key=integer value=integer
#     * Ex. prime_factors(20) => {2=>2, 5=>1}
#     * Ex. prime_factors()
#

def increase_counts(source, new)
  combined_counts = source.dup
  new.each { |k, v| combined_counts[k] = [v, combined_counts[k]].compact.max }
  combined_counts
end

def prime_factors(num)
  prime_factors = Hash.new(0)
  (2..num**0.5).each do |i|
    while num % i == 0
      prime_factors[i] += 1
      num /= i
    end

    return prime_factors if num == 1
  end

  {num => 1}
end

def main(top)
  all_factors = (2..top).inject({}) { |tot, i| increase_counts(tot, prime_factors(i))}
  all_factors.inject(1) { |tot, (k, v)| tot * k**v }
end

#---------------------------------------------------------------------------------------------------

euler_input = 20
puts(main(euler_input))

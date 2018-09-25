# Class for discovering and checking prime numbers
#---------------------------------------------------------------------------------------------------
# Readable Class Variables
#---------------------------------------------------------------------------------------------------
#
# @top -> The highest number checked in the set of Primes
# @arr -> Array with all primes equal or below @top
# @set -> Hashmap with prime numbers for keys and @arr index for values
# @prime_bool -> Boolean array of length (@top + 1) where @prime_bool[i]==true for all prime i
# @largest_found_prime -> the largets prime in the set
#
#---------------------------------------------------------------------------------------------------
# Instance Methods
#---------------------------------------------------------------------------------------------------
# 
# Primes.new(<arg>)
#   <arg> can be any positive integer (default = 100)
#      * <arg> sets @top which is the highest value checked
# 
# Primes.includes?(<arg>)
#   returns true if <arg> is prime
#   returns false if <arg> is not prime
#      * Automatically adjusts @top if <arg> > @top
#
# Primes.index(<arg>)
#   returns the index of <arg> in the prime list
#   returns nil if <arg> is not prime
#      * Automatically adjusts @top if <arg> > @top
#
#---------------------------------------------------------------------------------------------------
# Class Methods
#---------------------------------------------------------------------------------------------------
#
# Primes.is_prime(<arg>)
#   returns true if <arg> is prime
#   returns false if <arg> is not prime
#      * This method efficient for checking large prime numbers once
#      * Should only be used if checking a few numbers once.
#      * Inefficient for repeated checks.
#

class Primes

  attr_reader :top, :prime_bool, :set, :lst, :largest_found_prime
  
  def initialize(top = 100)
    @top = top
    @prime_bool = Array.new(@top + 1, true)
    @prime_bool[0..2] = false, false
    @largest_found_prime = 2
    @set = populate_set
    @lst = populate_lst
  end

  def includes?(num)
    raise "Input must be an integer" unless num.is_a?(Integer)
    increase_set(num) if num > @top
    @set[num].is_a?(Integer)
  end

  def index(num)
    increase_set(num) if num > @top
    @set[num]
  end

  def self.is_prime?(num)
    (2..num**0.5).each { |i| return false if num % i == 0 }
    true
  end

  private
  
    def populate_set(start=3, stop=@top, set={2 => 0})
      set.each do |k,_|
        ([(start / k), 2].max .. (stop / k)).each { |n| @prime_bool[k * n] = false}
      end
      
      (start..stop).each do |i|
        if @prime_bool[i]
          if !set[i]
            set[i] = set[@largest_found_prime] + 1
            @largest_found_prime = i
          end
          
          ([(start / i), 2].max .. (stop / i)).each { |n| @prime_bool[i * n] = false }
        end
      end
      
      set
    end

    def populate_lst
      @set.map { |k,v| k }
    end
    
    def increase_set(new_top)
      @prime_bool += [true] * (new_top - @top)
      @set = populate_set(@top, new_top, @set)
      @lst = populate_lst
      @top = new_top
    end
end


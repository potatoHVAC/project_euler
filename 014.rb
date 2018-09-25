# coding: utf-8
# Problem 014: Longest Collatz Sequence
#---------------------------------------------------------------------------------------------------
# The following iterative sequence is defined for the set of positive integers:
#
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
#
# It can be seen that this sequence (starting at 13 and finishing at 1) contains
# 10 terms. Although it has not been proved yet (Collatz Problem), it is thought
# that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.
#---------------------------------------------------------------------------------------------------
# Class Variables
#---------------------------------------------------------------------------------------------------
#
# @max -> the largest number assesed
# @dict -> Hashmap of collatz sequence
#   * key=integer variable=collatz number for key
# @max_i -> current integer with the longest collatz sequence checked
#
#---------------------------------------------------------------------------------------------------
# Instance Methods
#---------------------------------------------------------------------------------------------------
#
# main
#   outputs the integer with the longest collatz sequence for integers <= @max
#

class Collatz

  def initialize(max)
    @max = max
    @dict = {1 => 1}
    @max_i = 1
  end

  def main
    for i in 2..@max
      @dict[i] = fill_in_collatz(i)
      @max_i = i if @dict[i] > @dict[@max_i]
    end

    @max_i
  end

  # recursively fills in the collatz sequence length for current number and all numbers touched along the way.
  def fill_in_collatz(i)
    return @dict[i] if @dict[i]
    nxt = nxt_collatz(i)
    @dict[nxt] = fill_in_collatz(nxt)
    @dict[nxt] + 1
  end

  # finds the next collatz number in the sequence
  def nxt_collatz(num)
    num.even? ? num / 2 : num * 3 + 1
  end
end

#---------------------------------------------------------------------------------------------------

euler_input = 1_000_000
puts Collatz.new(euler_input).main


#

def is_pythag?(a,b,c)
  return false if [a,b,c].include?(0)
  a**2 + b**2 == c**2
end

def main(target)
  (1 .. target / 3).each do |a|
    (1 ... target / 2).each do |b|
      c = target - a - b
      return a * b * c if is_pythag?(a, b, c)
    end
  end
end

puts(main(1000))
    

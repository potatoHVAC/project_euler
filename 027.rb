def quad(a, b, n)
  n**2 + a * n + b
end

def prime_lst_len(a, b, prime_set)
  (0..b.abs).each { |n| return n if prime_set.not_include?(quad(a, b, n))}
end

def main(a_max, b_max)

end

main(-79, 1601)

        
    

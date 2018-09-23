import numpy as np

def is_prime(n):
    for i in range(2,int(n**0.5) + 1):
        if n%i == 0:
            return False
    return True

def populate_primes(top):
    primes = []
    for i in range(2, top + 1):
        if is_prime(i):
            primes.append(i)
    return primes

def main(top, max_prime):
    primes = populate_primes(max_prime)
    np_primes = np.asarray(primes)

    for size in range(len(np_primes), 0, -1):
        for start in range(len(np_primes) - size + 1):
            sum_lst = np_primes[start: start + size].sum()
            if is_prime(sum_lst) and sum_lst < top:
                return sum_lst
            
print(main(10**6, 10**4))

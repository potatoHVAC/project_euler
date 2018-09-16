def is_prime(num):
    for i in range(2,int(num**.5) + 1):
        if num % i == 0:
            return False
    return True

def populate_primes(max_num):
    primes = set()
    for i in range(2,max_num):
        if is_prime(i):
            primes.add(i)
    return primes

def rotate_num(arr):
    subset = arr[1:]
    subset.append(arr[0])
    return subset

def find_circular_primes(num, primes):
    combos = {num}
    num_lst = list(str(num))
    for i in range(1,len(str(num))):
        num_lst = rotate_num(num_lst)
        nxt_num = int(''.join(num_lst))
        if nxt_num not in primes:
            return None
        combos.add(nxt_num)
    return combos

def main(max_num):
    primes = populate_primes(max_num)
    circular_primes = set()
    for p in primes:
        if p in circular_primes:
            continue
        circular_set = find_circular_primes(p, primes)
        if circular_set:
            circular_primes |= circular_set
    return len(circular_primes)

print(main(1000000))

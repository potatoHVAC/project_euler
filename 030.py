def fifth_powers(num):
    num_arr = list(map(int, list(str(num))))
    return sum(map(lambda x: x**5, num_arr))

def solve(max_int):
    fifth_power_arr = []
    for i in range(2, max_int):
        if i == fifth_powers(i):
            fifth_power_arr.append(i)
    print(fifth_power_arr)
    return sum(fifth_power_arr)

print(solve(1000000))



def main(max, a=0, b=1, total = 0)
  total += a if a % 2 ==0
  return total if b > max
  main(max, b, a + b, total)
end

print(main(2))



def pwr_sum(pwr)
  (2**pwr).to_s.split('').map(&:to_i).sum
end


euler_input = 1000
puts(pwr_sum(euler_imput))

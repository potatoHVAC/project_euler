require 'csv'

def prime?(n)
  (2..n**0.5).each { |i| return false if n % i == 0 }
  true
end

def populate_primes(top)
  (2..top).select { |n| prime?(n) }
end

CSV.open('./primes_under_10_million.csv', 'wb') do |csv|
  csv << populate_primes(10_000_000)
end



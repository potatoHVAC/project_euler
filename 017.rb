class LetterNum
  def convert_to_len(num)
    if num == 1000
      11
    else
      split = num.to_s.split('').reverse
      sum = convert_hundreds(split[2].to_i) + convert_tens(split[0..1].reverse.join.to_i)
      if num % 100 == 0
        sum - 3
      else
        sum
      end
    end
  end
  
  def convert_hundreds(num)
    num > 0 ? convert_single(num) + 10 : 0
  end

  def convert_tens(num)
    if num >= 20
      tens = num.to_s.split('')[0].to_i
      ones = num.to_s.split('')[1].to_i
      
      if [2,3,8,9].include?(tens)
        6 + convert_single(ones)
      elsif [4,5,6].include?(tens)
        5 + convert_single(ones)
      else
        7 + convert_single(ones)
      end
    elsif num >= 10
      convert_teens(num)
    else
      convert_single(num)
    end
  end

  def convert_teens(num)
    if num == 10
      3
    elsif [11,12].include?(num)
      6
    elsif [13,14,18,19].include?(num)
      8
    elsif [15,16].include?(num)
      7
    else
      9
    end
  end
    
    
  def convert_single(num)
    if [1,2,6].include?(num)
      3
    elsif [3,7,8].include?(num)
      5
    elsif [4,5,9].include?(num)
      4
    else
      0
    end
  end

  def solve
    total = 0
    (1..1000).each { |n| total += convert_to_len(n)}
    total
  end
end

puts(LetterNum.new.solve)
puts(LetterNum.new.convert_to_len(99))

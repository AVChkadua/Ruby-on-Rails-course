def lastDigit(base, power)
  if power == 0
    return 1
  else
    case (base % 10)
    when 1, 5, 6
      return base % 10
    when 2, 3, 7, 8
      return ((base % 10) ** (power - 4 * (power / 4).to_i)) % 10
    when 4, 9
      return ((base % 10) ** (power - 3 * (power / 3).to_i)) % 10
    else
      return 0
    end
  end
end

amount = gets
cases = Array.new
1.upto(amount.to_i) do |i|
  input = gets
  cases += [input]
end
cases.each do |task|
  buf = task.split(" ")
  base = buf[0].to_i
  power = buf[1].to_i
  puts lastDigit(base, power)
end

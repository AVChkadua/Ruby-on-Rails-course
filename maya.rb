def convert(strings)
  result = 0
    0.upto(strings.length - 1) do |i|
      if !strings[i].eql?("S")
        buf = 5 * countSymbols(strings[i], "-")
        buf += countSymbols(strings[i], ".")
        buf *= getMultiplier(i)
        result += buf
      end
    end
  return result
end

def countSymbols(string, symbol)
  count = 0
  0.upto(string.length - 1) do |i|
    if string[i].eql?(symbol)
      count += 1
    end
  end
  return count
end

def getMultiplier(i)
  case i
  when 0
    return 1
  when 1
    return 20
  else
    return 360 * (20 ** (i - 2))
  end
end

amount = gets.to_i
while amount != 0
  strings = Array.new
  1.upto(amount) do |i|
    buf = gets
    strings.push(buf)
  end
  gets
  strings.reverse!
  puts convert(strings)
  amount = gets.to_i
end

def pour(small, big, needed, cur, steps)
  if cur[0] == needed or cur[1] == needed
    return steps
  end
  if steps > 20
    return -1
  end
  best = checkForBest(pour(small, big, needed, [small, cur[1]], steps + 1), -1)
  best = checkForBest(pour(small, big, needed, [cur[0], big], steps + 1), best)
  if small - cur[0] > 0
    best = checkForBest(pour(small, big, needed, [small, cur[1] - (small - cur[0])], steps + 1), best)
  end
  if big - cur[1] > 0
    best = checkForBest(pour(small, big, needed, [cur[0] - (big - cur[1]), big], steps + 1), best)
  end
  return best
end

def possible?(small, big, needed)
  if needed.lcm(small.gcd(big)) == needed and big >= needed
    return true
  else
    return false
  end
end

def checkForBest(cur, best)
  if cur != -1 and cur < best or best == -1
    return cur
  else
    return best
  end
end

number = gets.to_i
0.upto(number - 1) do |i|
  first = gets.to_i
  second = gets.to_i
  needed = gets.to_i
  if first > second
    first, second = second, first
  end
  if possible?(first, second, needed)
    puts pour(first, second, needed, [0, 0], 0).to_s
  else
    puts "-1"
  end
end

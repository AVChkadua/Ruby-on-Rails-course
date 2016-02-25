def try(sequence)
  stack = Array.new
  i = 0
  while i < sequence.length - 1
    if sequence[i] > sequence[i + 1]
      stack.push(sequence.delete_at(i))
      if stack.length > 1 and stack[-1] > stack[-2] then return 1 end
    elsif sequence[i] > stack[-1]
      stack.pop
    else
      i += 1
    end
  end
  return 0
end

amount = gets
sequence = gets
seq = sequence.split(" ")
if try(seq) == 0
  puts "yes"
else
  puts "no"
end

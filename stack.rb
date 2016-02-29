def try(amount, sequence)
  seq = sequence.split(" ")
  0.upto(amount.to_i - 1) do |i|
    seq[i] = seq[i].to_i
  end
  stack = Array.new
  i = 0
  j = 1
  while j < amount.to_i + 1
    if seq[i] != j
      if stack[-1] != nil and stack[-1] == j
        stack.pop
        j += 1
      elsif stack[-1] != nil and seq[i] != nil and stack[-1] < seq[i]
        return 1
      else
        if seq[i] != nil
          stack.push(seq.delete_at(i))
        end
      end
    else
      i += 1
      j += 1
    end
  end
  return 0
end

amount = gets
tasks = Array.new
while !amount.eql?("0\n")
  sequence = gets
  tasks += [[amount, sequence]]
  amount = gets
end
tasks.each do |elem|
  if try(elem[0], elem[1]) == 0
    puts "yes"
  else
    puts "no"
  end
end

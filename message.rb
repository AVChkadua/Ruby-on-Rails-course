def toMatrix(message, size)
  matrix = Array.new
  reverse = false
  while !message.empty?
    buf = message.slice!(0, size)
    if reverse
      buf.reverse!
    end
    reverse = !reverse
    matrix += [buf.split(//)]
  end
  return matrix
end

def readMatrix(matrix, columns)
  result = ""
  0.upto(columns) do |i|
    0.upto(matrix.length - 1) do |j|
      result += matrix[j][i].to_s
    end
  end
  return result
end

columns = gets.to_i
while columns != 0
  string = gets
  string.chop!
  matrix = toMatrix(string, columns)
  puts readMatrix(matrix, columns)
  columns = gets.to_i
end

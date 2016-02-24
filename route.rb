def findRoute(current, curRoute, bestRoute, points, step)
  if current == points[-1]
    if (curRoute.length < bestRoute.length or bestRoute.length == 0)
      (bestRoute.length).downto 0  do |i|
        bestRoute.delete_at(i)
      end
      0.upto curRoute.length - 1 do |i|
        bestRoute.push(curRoute[i])
      end
    end
    return
  end
  available = getAvailable(current, points, step)
  available.each do |point|
    if [point] & curRoute == []
      curRoute += [point]
      findRoute(point, curRoute, bestRoute, points, step)
      curRoute.pop
    end
  end
end

def getDistance(cur, other)
  distance = Math.sqrt((cur[0] - other[0]) ** 2 + (cur[1] - other[1]) ** 2)
end

def getAvailable(cur, points, step)
  available = Array.new(Array.new)
  points.each do |point|
    if (getDistance(cur, point) <= step) and (point != cur)
      available += [point]
    end
  end
  return available
end

puts 'Введите размер поля:'
size = gets.to_f()
puts "Введите максимальный шаг:"
step = gets.to_f()
puts 'Введите точки. Ввод заканчивается точкой (".")'
points = Array.new
point = gets
i = 0
while point[0] != '.' do
  x, y = point.split(', ')
  points[i] = [x.to_f(), y.to_f()]
  i += 1
  point = gets
end
points = [[0.to_f(), 0.to_f()]] + points + [[size.to_f(), size.to_f()]]
bestRoute = Array.new(Array.new)
route = findRoute(points[0], [[0.to_f, 0.to_f]], bestRoute, points, step)
puts bestRoute.to_s

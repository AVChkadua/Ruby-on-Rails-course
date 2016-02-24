class Frac
  include Comparable
  @x
  @y

  def initialize(x, y)
    @x = x.to_i()
    @y = y.to_i()
    return simple()
  end

  def getX()
    @x
  end

  def getY()
    @y
  end

  def simple()
    nod = findNOD(@x, @y)
    @x /= nod
    @y /= nod
  end

  def findNOD(a,b)
    if (b > a)
      a ^= b
      b ^= a
      a ^= b
    end
    r = a % b
    while (r > 0) do
      a = b
      b = r
      r = a % b
    end
    return b
  end

  def to_s()
    puts @x.to_s() + '/' + @y.to_s()
  end

  def +(other)
    Frac.new(@x * other.getY() + @y * other.getX(), @y * other.getY())
  end

  def -(other)
    Frac.new(@x * other.getY() - @y * other.getX(), @y * other.getY())
  end

  def *(other)
    Frac.new(@x * other.getX(), @y * other.getY())
  end

  def /(other)
    Frac.new(@x * other.getY(), @y * other.getX())
  end

  def ==(other)
    @x.eql?(other.getX()) && @y.eql?(other.getY())
  end

  def <=>(other)
    @x * other.getY() <=> @y * other.getX()
  end

  def to_i()
    x = @x - (@x % @y)
    x / @y
  end

  def to_f()
    @x.to_f() / @y.to_f()
  end

  def number()
    res = 0
    if @x.eql?(1) && @y.eql?(1)
      return 1
    end
    1.upto(@x + @y - 2) do |i|
      res += i
    end
    res += @x
  end
end

a = Frac.new(10, 15)
puts a.to_s()

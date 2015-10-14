class Coordenada
  attr_accessor :x, :y

  def initialize(x,y)
    @x = x
    @y = y
  end

  def siguiente(orientacion, n)
    return orientacion.aumentar(self.clone, n)
  end

  def ==(coord) 
    return coord.x == @x && coord.y == @y
  end 

  alias eql? ==

  def hash() 
    return @x.hash^@y.hash
  end

end

class OrientacionFactory
  def self.clase(tipo) 
    return Object.const_get(tipo.to_s.capitalize)
  end
end

class Horizontal 
  def self.aumentar(coord, n)
    coord.x = coord.x + n
    return coord
  end
end

class Vertical 
  def self.aumentar(coord, n)
    coord.y = coord.y - n
    return coord
  end
end 


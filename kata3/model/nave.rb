require_relative 'coordenada'

class NaveFactory
  def self.clase(tipo)
    return Object.const_get(tipo.to_s.capitalize)
  end
  def self.construir(tipo)
    self.clase(tipo).new
  end
end

class Nave
  attr_reader :posiciones
  INTACTO='intacto'
  AVERIADO='averiado'

  def initialize()
    @posiciones = {}
  end

  def golpe_en(coord)
    @posiciones[coord] = AVERIADO 
  end

  def ocupa(coord) 
    @posiciones[coord] = INTACTO
  end

  def averiado? 
    @posiciones.values.any? { | estado | estado == AVERIADO }
  end

  def hundido? 
    @posiciones.values.all? { | estado | estado == AVERIADO }
  end
end

class Submarino < Nave
  def tamanio 
    return 1
  end
end

class Crucero < Nave
  def tamanio
    return 2
  end
end

class Destructor < Nave
  def tamanio
    return 3
  end
end


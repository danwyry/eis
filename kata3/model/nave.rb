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
  INTACTO='intacto'
  AVERIADO='averiado'

  def initialize()
    @posiciones = {}
  end

  def posiciones
    return @posiciones.keys
  end 

  def golpe_en(coord)
    @posiciones[coord] = AVERIADO 
  end

  def ocupar_posicion(coord) 
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
  def ubicar_en(coord) 
    @posiciones = {} 
    ocupar_posicion coord
  end
end

class NaveGrande <Nave
  def ubicar_en(coord, orientacion) 
    @posiciones = {} 
    for n in  0..tamanio-1
      ocupar_posicion coord.siguiente(orientacion,n)
    end
  end
end 
class Crucero < NaveGrande
  def tamanio
    return 2
  end
end

class Destructor < NaveGrande
  def tamanio
    return 3
  end
end


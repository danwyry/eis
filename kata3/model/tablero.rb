require_relative 'coordenada'

class Tablero 
  attr_reader :ancho, :alto

  def initialize(ancho, alto) 
    @ancho = ancho
    @alto = alto 
    @ocupados = {} 
  end

  def ocupado?(coord)
    return  @ocupados.key? coord
  end

  def nave_en(coord) 
    return @ocupados[coord]
  end

  def ubicar_nave(nave, coord, orientacion)
    if nave.tamanio > 1
      ocupar_posiciones nave, coord, orientacion
    else
      ocupar_posicion nave, coord 
    end
  end

  def disparar(coord) 
    if ocupado? coord
      nave_en(coord).golpe_en coord
    end
    return ocupado? coord
  end

  private

  def ocupar_posicion(nave, coord)
    if (ocupado? coord)
      raise PosicionOcupadaException
    end
    if fuera_de_tablero(coord)
      raise FueraDeTableroException
    end

    nave.ocupa coord
    @ocupados[coord]=nave
  end

  def ocupar_posiciones(nave, coord, orientacion)
    begin 
      for n in  0..nave.tamanio-1
        ocupar_posicion nave, coord.siguiente(orientacion,n)
      end
    rescue PosicionOcupadaException => exception
      quitar_nave(nave) 
      raise PosicionOcupadaException
    end
  end

  def fuera_de_tablero(coord)
    return  (coord.x > @ancho || coord.x < 1 || coord.y > @alto || coord.y < 1 )
  end

  def quitar_nave(nave)
    @ocupados.delete_if { | coord, actual | actual == nave }
  end


end

class OrientacionFactory
  def self.clase(tipo) 
    return Object.const_get(tipo.to_s.capitalize)
  end
end


class PosicionOcupadaException <Exception
end

class FueraDeTableroException <Exception
end


class Tablero 
  attr_reader :ancho, :alto

  def initialize(ancho, alto) 
    @ancho = ancho
    @alto = alto 
    @ocupados = {} 
  end

  def ocupado?(x,y)
    return  @ocupados.key? [x,y]
  end

  def nave_en(x,y) 
    coord = [x,y]
    return @ocupados[coord]
  end

  def ubicar_nave(nave, x, y, orientacion)
    if nave.tamanio > 1
      ocupar_posiciones nave, [x,y], orientacion
    else
      ocupar_posicion nave, [x,y]
    end
  end

  def disparar(x, y) 
    if ocupado? x,y
      nave_en(x,y).golpe_en [x,y]
    end
    return ocupado? x,y
  end

  private

  def ocupar_posicion(nave, coord)
    if (@ocupados.key? coord)
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
        ocupar_posicion nave, orientacion.aumentar(coord,n)
      end
    rescue PosicionOcupadaException => exception
      quitar_nave(nave) 
      raise PosicionOcupadaException
    end
  end

  def fuera_de_tablero(coord)
    x = coord[0]
    y = coord[1]
    return  (x > @ancho || x < 1 || y > @alto || y < 1 )
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

class Horizontal 
  def self.aumentar(coord, n)
    res = coord.clone
    res[0] = res[0] + n
    return res
  end
end

class Vertical 
  def self.aumentar(coord, n)
    res = coord.clone
    res[1] = res[1] - n
    return res
  end
end 


class PosicionOcupadaException <Exception
end

class FueraDeTableroException <Exception
end


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

class Tablero 
  attr_reader :ancho, :alto

  HORIZONTAL=Horizontal
  VERTICAL=Vertical

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
    if fuera_de_rango(x,y)
      raise FueraDeRangoException
    end

    if nave.tamanio > 1
      ocupar_posiciones nave, [x,y], orientacion
    else
      ocupar_posicion nave, [x,y]
    end
  end

  def fuera_de_rango(x, y)
    false
  end

  private

  def ocupar_posicion(nave, coord)
    if (@ocupados.key? coord)
      raise PosicionOcupadaException
    end
    @ocupados[coord]=nave
  end

  def ocupar_posiciones(nave, coord, orientacion)
    for n in  0..nave.tamanio-1
      ocupar_posicion nave, orientacion.aumentar(coord,n)
    end
  end
end

class OrientacionFactory
  def self.clase(tipo) 
    return Object.const_get(tipo.to_s.capitalize)
  end
end

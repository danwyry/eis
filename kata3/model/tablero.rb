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

  def ubicar_nave(nave, x, y)
    if fuera_de_rango(x,y) 
      raise FueraDeRangoException
    end
    ocupar_posiciones(nave, x,y) 
  end

  def fuera_de_rango(x, y) 
    false
  end

  def ocupar_posiciones(nave, x, y) 
    coord = [x,y]
    @ocupados[coord] = nave
  end
end

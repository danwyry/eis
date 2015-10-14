require_relative 'tablero'
require_relative 'nave'
require_relative 'coordenada'

class BatallaNaval
  attr_reader :alto_tablero, :ancho_tablero
  def initialize(ancho, alto) 
    @ancho_tablero = ancho
    @alto_tablero = alto
    @tablero_jugador = { 1 => Tablero.new(@ancho_tablero, @alto_tablero) }
  end

  def ocupado?(jugador, x, y) 
    coord = Coordenada.new x,y 
    @tablero_jugador[jugador].ocupado? coord
  end

  def nave_en(jugador, x, y)
    coord = Coordenada.new x,y 
    @tablero_jugador[jugador].nave_en coord
  end

  def ubicar_nave(jugador, tipo_nave, x, y, tipo_orientacion="horizontal") 
    nave = NaveFactory.construir(tipo_nave)
    orientacion = OrientacionFactory.clase(tipo_orientacion)
    coord = Coordenada.new x,y
    @tablero_jugador[jugador].ubicar_nave(nave, coord, orientacion) 
  end

  def disparar(jugador, x, y) 
    coord = Coordenada.new x,y 
    return @tablero_jugador[jugador].disparar coord
  end

end

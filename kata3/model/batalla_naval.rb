require_relative 'tablero'
require_relative 'nave'

class BatallaNaval
  attr_reader :alto_tablero, :ancho_tablero
  def initialize(ancho, alto) 
    @ancho_tablero = ancho
    @alto_tablero = alto
    @tablero_jugador = { 1 => Tablero.new(@ancho_tablero, @alto_tablero) }
  end

  def ocupado?(jugador, x, y) 
    @tablero_jugador[jugador].ocupado? x,y
  end

  def nave_en(jugador, x, y)
    @tablero_jugador[jugador].nave_en x,y
  end

  def ubicar_nave(jugador, tipo_nave, x, y, tipo_orientacion=Tablero::HORIZONTAL) 
    nave = NaveFactory.construir(tipo_nave)
    orientacion = OrientacionFactory.clase(tipo_orientacion)
    @tablero_jugador[jugador].ubicar_nave(nave, x, y, orientacion) 
  end


end

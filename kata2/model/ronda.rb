class Ronda

  def initialize(jugada_jugador1, jugada_jugador2)
    @jugada_jugador1 = jugada_jugador1
    @jugada_jugador2 = jugada_jugador2
  end

  def ganador
    if @jugada_jugador1.empata_con? @jugada_jugador2 
      return nil
    elsif @jugada_jugador1.le_gana_a? @jugada_jugador2
      return @jugada_jugador1.jugador
    else
      return @jugada_jugador2.jugador
    end
  end
end

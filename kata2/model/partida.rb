require_relative 'ronda'

class Partida
  def initialize(jugador1 , jugador2)
    @jugador1 = jugador1
    @jugador2 = jugador2
    @rondas = [] 
  end

  def rondas_jugadas
    return @rondas.length()
  end

  def jugador1
    return @jugador1
  end

  def jugador2
    return @jugador2
  end

  def numero_rondas
    return 3
  end

  def jugar_ronda(jugada_jugador1, jugada_jugador2)
    if @rondas.length < self.numero_rondas
      @rondas.push Ronda.new(jugada_jugador1, jugada_jugador2)
    else
      raise PartidaFinalizadaError
    end
  end

  def ganador
    if cant_rondas_ganadas_por(@jugador1) > cant_rondas_ganadas_por(@jugador2)
      return jugador1
    elsif cant_rondas_ganadas_por(@jugador2) > cant_rondas_ganadas_por(@jugador1)
      return jugador2
    else
      return nil
    end
  end

  def cant_rondas_ganadas_por(jugador)
    return rondas_ganadas_por(jugador).size
  end

  def rondas_ganadas_por(jugador)
    return @rondas.map(&:ganador).select{| j |  j.eql? jugador }
  end

end

class PartidaFinalizadaError < Exception
end

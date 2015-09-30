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
    if @rondas.length < self.numero_rondas
      return nil 
    else  
      return self.ganadores_por_ronda.elemento_mayoritario
    end
  end

  def ganadores_por_ronda
    return @rondas.map(&:ganador).select{|jugador| not jugador.nil? }
  end
end

class PartidaFinalizadaError < Exception
end


class Array 
  def elemento_mayoritario()
    return self.group_by(&:itself).values.max_by(&:size).first
  end
end

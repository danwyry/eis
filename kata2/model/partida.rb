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

    def jugar_ronda(jugada_jugador1, jugada_jugador2)
        @rondas.push Ronda.new jugada_jugador1, jugada_jugador2
    end

    def ganador
        if @rondas.length < 3
            return nil 
        else 
            return @rondas.collect { |ronda| ronda.ganador_entre? @jugador1,@jugador2 }.majority
        end
    end
end


class Array 
    def majority()
        self.group_by(&:itself).values.max_by(&:size).first
    end
end

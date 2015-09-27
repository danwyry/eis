class Partida
    def initialize(jugador1 , jugador2)
        @jugador1 = jugador1
        @jugador2 = jugador2
        @rondas_jugadas = 0 
    end

    def rondas_jugadas
        return @rondas_jugadas
    end

    def jugador1
        return @jugador1
    end

    def jugador2
        return @jugador2
    end

end


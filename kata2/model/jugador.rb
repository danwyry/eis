require_relative 'jugada'
class Jugador
    def juega(jugada)
        @jugada = jugada.new()
    end

    def jugada()
        return @jugada
    end
end

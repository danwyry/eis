require_relative 'jugada'
class Jugador
    def juega(tipo_elemento)
        return Jugada.new self, tipo_elemento
    end

end

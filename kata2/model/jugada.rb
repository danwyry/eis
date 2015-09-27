class Jugada

    def initialize()
        @les_gana_a = []
    end

    def le_gana_a?(otra_jugada)
        @les_gana_a.member? otra_jugada.class
    end

end

class Tijera < Jugada
end

class Piedra < Jugada
    def initialize()
        @les_gana_a = [ Tijera ]
    end
end


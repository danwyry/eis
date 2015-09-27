class Jugada

    def initialize()
        @le_ganan = []
    end

    def le_gana_a?(otra_jugada)
        @le_ganan.member? otra_jugada.class
    end

end

class Tijera < Jugada
end

class Piedra < Jugada
    def initialize()
        @le_ganan = [ Tijera ]
    end
end


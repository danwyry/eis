class Jugada

    def initialize(jugador, tipo_elemento) 
        @jugador = jugador
        @elemento = tipo_elemento.new()
    end

    def empata_con? jugada
        return @elemento.empata_con? jugada.elemento
    end
    
    def le_gana_a? jugada
        return @elemento.le_gana_a? jugada.elemento
    end

    def jugador
        return @jugador
    end

    def elemento
        return @elemento
    end

end

class Elemento 

    def initialize()
        @les_gana_a = []
    end

    def empata_con?(otra_jugada)
        return not( self.le_gana_a?(otra_jugada) or otra_jugada.le_gana_a?(self) )
    end

    def le_gana_a?(otra_jugada)
        @les_gana_a.member? otra_jugada.class
    end

end

class Tijera < Elemento
    def initialize()
        @les_gana_a = [ Papel , Mono ]
    end
end

class Piedra < Elemento
    def initialize()
        @les_gana_a = [ Tijera ]
    end
end

class Papel < Elemento
    def initialize()
        @les_gana_a = [ Piedra ]
    end
end

class Mono < Elemento
    def initialize()
        @les_gana_a = [ Papel ]
    end
end

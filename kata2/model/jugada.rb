require_relative 'elemento'
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

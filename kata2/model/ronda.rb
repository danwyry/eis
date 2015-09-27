class Ronda

    def ganador_entre?(jugador1, jugador2)

        if jugador1.jugada.empata_con? jugador2.jugada
            return nil
        elsif jugador1.jugada.le_gana_a? jugador2.jugada
            return jugador1
        else 
            return jugador2
        end

    end

end

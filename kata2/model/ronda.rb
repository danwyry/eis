class Ronda

    def ganador_entre?(jugador1, jugador2)

        if jugador1.jugada.le_gana_a? jugador2.jugada
            return jugador1
        elsif jugador2.jugada.le_gana_a? jugador1.jugada
            return jugador2
        else
            return nil
        end

    end

end

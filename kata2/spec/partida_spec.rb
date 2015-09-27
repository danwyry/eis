#Consigna:
#
# Por otro lado aparece el concepto de "partida", una partida es una competencia
# al mejor de tres rondas. O sea, un jugador para ganar una partida tiene que
# ganar 2 rondas (análogo a lo que ocurre en el tenis o el voley con los sets).
#
# Ejemplo 2: dinámica de una partida
# jugador1 gana la primera ronda
# jugador2 gana la segunda ronda
# entonces hasta el momento no hay ganador de la partida
# jugador2 gana la tercera ronda
# entonces la partida la gana jugador2%
#
# Una vez completa la tarea, generar un TAG en el repositorio y subir a alfred el link a dicho TAG
# Fecha de entrega 30 de Septiembre

require 'rspec'
require_relative '../model/partida'
require_relative '../model/jugador'

describe 'Partida' do
    let(:jugador1) { Jugador.new }
    let(:jugador2) { Jugador.new }
    let(:partida) { Partida.new jugador1, jugador2  }

    it 'la partida se inicializa con 2 jugadores' do
        expect(partida.jugador1).to eq jugador1
        expect(partida.jugador2).to eq jugador2
    end

    it 'la partida se inicializa con el contador de rondas jugadas en 0' do
        expect(partida.rondas_jugadas).to eq 0
    end

    it 'jugar_ronda el contador de rondas jugadas se incrementa en 1' do
        expect(partida.rondas_jugadas).to eq 0
        partida.jugar_ronda jugador1.juega(Tijera), jugador2.juega(Papel)
        expect(partida.rondas_jugadas).to eq 1
    end

    it 'ganador devuelve nil si no se jugaron todas las rondas necesarias' do
        expect(partida.ganador).to eq nil
        partida.jugar_ronda jugador1.juega(Tijera), jugador2.juega(Papel)
        expect(partida.ganador).to eq nil
        partida.jugar_ronda jugador1.juega(Tijera), jugador2.juega(Papel)
        expect(partida.ganador).to eq nil
        partida.jugar_ronda jugador1.juega(Tijera), jugador2.juega(Papel)
        expect(partida.ganador).not_to eq nil
    end

    it 'ganador jugar_ronda lanza un PartidaFinalizadaError si ya se jugaron todas las rondas de una partida' do
        partida.jugar_ronda jugador1.juega(Tijera), jugador2.juega(Papel)
        partida.jugar_ronda jugador1.juega(Tijera), jugador2.juega(Papel)
        partida.jugar_ronda jugador1.juega(Tijera), jugador2.juega(Papel)

        expect{ partida.jugar_ronda jugador1.juega(Tijera), jugador2.juega(Papel) }.to raise_error(PartidaFinalizadaError)
    end

end

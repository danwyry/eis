#Consigna:
#
# La primer variación es Piedra-Papel-Tijera-Mono, a las reglas ya conocidas se
# agrega:
#
# * Mono gana a papel
# * Mono pierde con tijera
# * Mono empata con Piedra
#
# Ejemplo 1: dinámica de una ronda
# jugador1 juega piedra
# jugador2 juega papel
# entonces la ronda la gana jugador2
#
# Una vez completa la tarea, generar un TAG en el repositorio y subir a alfred el link a dicho TAG
# Fecha de entrega 30 de Septiembre

require 'rspec'
require_relative '../model/partida'

describe 'Ronda' do
    let(:partida) { Partida.new }

    it 'la partida se inicializa sin jugadores' do
        expect(partida.jugador1).to eq nil
        expect(partida.jugador2).to eq nil
    end

end

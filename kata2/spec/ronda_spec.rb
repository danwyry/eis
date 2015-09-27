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
require_relative '../model/ronda'
require_relative '../model/jugador'

describe 'Ronda' do
    let(:jugador1) { Jugador.new() }
    let(:jugador2) { Jugador.new() }

    it 'ganador devuelve jugador1 si su jugada le gana a la de jugador2' do
        ronda = Ronda.new jugador1.juega(Piedra), jugador2.juega(Tijera)
        expect(ronda.ganador).to eq jugador1
    end

    it 'ganador devuelve jugador2 si su jugada le gana a la de jugador1' do
        ronda = Ronda.new jugador1.juega(Tijera), jugador2.juega(Piedra)
        expect(ronda.ganador).to eq jugador2
    end
end


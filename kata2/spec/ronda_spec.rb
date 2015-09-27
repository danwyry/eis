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
    let(:ronda) { Ronda.new }
    let(:jugador1) { Jugador.new() }
    let(:jugador2) { Jugador.new() }

    it 'piedra le gana tijera' do
        jugador1.juega Piedra
        jugador2.juega Tijera
		expect(ronda.ganador_entre? jugador1 , jugador2 ).to eq jugador1
    end

    it 'tijera le gana papel' do
        jugador1.juega Tijera
        jugador2.juega Papel
		expect(ronda.ganador_entre? jugador1 , jugador2 ).to eq jugador1
    end

    it 'papel le gana a piedra' do
        jugador1.juega Papel
        jugador2.juega Piedra
        expect(ronda.ganador_entre? jugador1, jugador2 ).to eq jugador1
   end
end


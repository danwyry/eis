require 'rspec'
require_relative '../model/jugada'
require_relative '../model/jugador'
require_relative '../model/elemento'

describe 'Jugada' do
    let(:jugada) { Jugada.new(Jugador.new, Tijera) }

    it 'jugada se inicializa con un jugador' do
        expect(jugada.jugador).to be_a_kind_of Jugador
    end

#    it 'jugada se inicializa con un jugador' do
#        expect(jugada.elemento).to  be
#    end
end

require 'rspec'
require_relative '../model/jugada'
require_relative '../model/jugador'
require_relative '../model/jugada'
require_relative '../model/elemento'

describe 'Jugada' do
    let(:jugador) { Jugador.new }

    it 'juega devuelve un objeto de tipo Jugada' do
        expect(jugador.juega Tijera).to be_an_instance_of Jugada
    end

end

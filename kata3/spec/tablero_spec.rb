require 'rspec'
require_relative '../model/coordenada.rb'
require_relative '../model/tablero.rb'

describe 'Tablero' do
  let(:tablero) { Tablero.new(10,10) }

  it 'el juego se inicializa con todos los casilleros desocupados' do

    for x in 1..10
      for y in 1..10
        coord = Coordenada.new x,y
        expect( tablero.ocupado? coord).to be_falsey 
      end
    end

  end
end

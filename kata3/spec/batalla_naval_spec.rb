require 'rspec'
require_relative '../model/batalla_naval.rb'

describe 'BatallaNaval' do
  let(:juego) { BatallaNaval.new(10,10) }

  it 'el juego se inicializa con tableros de 10 casilleros de alto y 10 de ancho' do
    expect(juego.alto_tablero).to eq 10
    expect(juego.ancho_tablero).to eq 10
  end

end

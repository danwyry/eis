require 'rspec'
require_relative '../model/batalla_naval.rb'

describe 'BatallaNaval' do
  let(:juego) { BatallaNaval.new(10,10) }
  let(:jugador) { 1 }

  it 'el juego se inicializa con tableros de 10 casilleros de alto y 10 de ancho' do
    expect( juego.alto_tablero ).to eq 10
    expect( juego.ancho_tablero ).to eq 10
  end

  it 'ubicar_nave(jugador, "submarino", 1, 1) ubica un submarino en la posicion (1,1) del tablero del jugador' do
    juego.ubicar_nave jugador, "submarino", 1, 1
    expect( juego.ocupado?(jugador, 1, 1) ).to be_truthy
    expect( juego.nave_en(jugador, 1, 1) ).to be_an_instance_of Submarino
  end

end

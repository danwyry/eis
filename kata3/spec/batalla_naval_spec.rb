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

  it 'ubicar_nave(jugador, "crucero", 1,2, "horizontal") ubica un crucero ocupando las posiciones (1,2) y (2,2) del tablero del jugador' do

    juego.ubicar_nave jugador, "crucero", 1, 2, "horizontal"

    expect( juego.ocupado?(jugador, 1, 2) ).to be_truthy
    expect( juego.ocupado?(jugador, 2, 2) ).to be_truthy

    expect( juego.nave_en(jugador, 1, 2) ).to be_an_instance_of Crucero
    expect( juego.nave_en(jugador, 2, 2) ).to be_an_instance_of Crucero

  end

  it 'ubicar_nave(jugador, "crucero", 1,10, "vertical") ubica un crucero ocupando las posiciones (1,10) y (1,9) del tablero del jugador' do
    juego.ubicar_nave jugador, "crucero", 1, 10, "vertical"

    expect( juego.ocupado?(jugador, 1, 10) ).to be_truthy
    expect( juego.ocupado?(jugador, 1, 9) ).to be_truthy

    expect( juego.nave_en(jugador, 1, 10) ).to be_an_instance_of Crucero
    expect( juego.nave_en(jugador, 1, 9) ).to be_an_instance_of Crucero

  end

  it 'ubicar_nave(jugador, "destructor", 1,3, "horizontal") ubica un crucero ocupando las posiciones (1,2), (2,2) y (3,2) del tablero del jugador' do

    juego.ubicar_nave jugador, "destructor", 1, 3, "horizontal"

    expect( juego.ocupado?(jugador, 1, 3) ).to be_truthy
    expect( juego.ocupado?(jugador, 2, 3) ).to be_truthy
    expect( juego.ocupado?(jugador, 3, 3) ).to be_truthy

    expect( juego.nave_en(jugador, 1, 3) ).to be_an_instance_of Destructor
    expect( juego.nave_en(jugador, 2, 3) ).to be_an_instance_of Destructor
    expect( juego.nave_en(jugador, 3, 3) ).to be_an_instance_of Destructor

  end

  it 'ubicar_nave(jugador, "destructor", 2,10, "vertical") ubica un crucero ocupando las posiciones (2,10), (2,9) y (2,8) del tablero del jugador' do
    juego.ubicar_nave jugador, "destructor", 2, 10, "vertical"

    expect( juego.ocupado?(jugador, 2, 10) ).to be_truthy
    expect( juego.ocupado?(jugador, 2, 9) ).to be_truthy
    expect( juego.ocupado?(jugador, 2, 8) ).to be_truthy

    expect( juego.nave_en(jugador, 2, 10) ).to be_an_instance_of Destructor
    expect( juego.nave_en(jugador, 2, 9) ).to be_an_instance_of Destructor
    expect( juego.nave_en(jugador, 2, 8) ).to be_an_instance_of Destructor

  end

  it 'ubicar_nave(jugador, "submarino", 5,5) lanza una PosicionOcupadaException si la posicion (5,5) ya estaba ocupada por otra nave' do
    juego.ubicar_nave jugador, "submarino", 5, 5

    expect{ juego.ubicar_nave(jugador, "submarino", 5, 5 ) }.to raise_error PosicionOcupadaException
  end

  it 'ubicar_nave(jugador, "crucero", 4,5, "horizontal") lanza una PosicionOcupadaException si una de las posiciones a ocupar por el crucero ya estaba ocupada por otra nave' do
    juego.ubicar_nave jugador, "submarino", 5, 5

    expect{ juego.ubicar_nave(jugador, "crucero", 4, 5, 'horizontal' ) }.to raise_error PosicionOcupadaException
  end
  
  it 'ubicar_nave(jugador, "destructor", 3,5, "horizontal") lanza una PosicionOcupadaException si una de las posiciones a ocupar por el destructor ya estaba ocupada por otra nave' do
    juego.ubicar_nave jugador, "submarino", 5, 5

    expect{ juego.ubicar_nave(jugador, "destructor", 3, 5, 'horizontal' ) }.to raise_error PosicionOcupadaException
  end


end

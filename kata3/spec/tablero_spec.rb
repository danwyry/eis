require 'rspec'
require_relative '../model/coordenada.rb'
require_relative '../model/tablero.rb'

describe 'Tablero' do
  let(:tablero) { Tablero.new(10,10) }

  it 'el tablero se inicializa con todos los casilleros desocupados' do

    for x in 1..10
      for y in 1..10
        coord = Coordenada.new x,y
        expect( tablero.ocupado? coord).to be_falsey 
      end
    end

  end

  it 'ocupado? Coordenada.new 1,1 devuelve false si la posicion (1,1) esta desocupada' do
    expect(tablero.ocupado? Coordenada.new(1,1)).to be_falsey
  end

  it 'ocupado? Coordenada.new 1,1 devuelve true si la posicion (1,1) esta ocupada por alguna nave' do
    coord = Coordenada.new 1,1
    tablero.ubicar_nave Submarino.new, coord
    expect(tablero.ocupado? Coordenada.new(1,1)).to be_truthy
  end

  it 'ubicar_nave? Submarino.new, Coordenada.new(1,1) ocupa la posicion (1,1) con un submarino' do
    coord = Coordenada.new 1,1
    tablero.ubicar_nave Submarino.new, coord
    expect(tablero.ocupado? coord).to be_truthy
    expect(tablero.nave_en coord).to be_an_instance_of Submarino
  end

  it 'ubicar_nave? Crucero.new, Coordenada.new(1,1), Horizontal  ocupa las posicion (1,1) y (2,1) con un Crucero' do
    coord1 = Coordenada.new 1,1
    coord2 = Coordenada.new 2,1

    tablero.ubicar_nave Crucero.new, coord1, Horizontal

    expect(tablero.ocupado? coord1).to be_truthy
    expect(tablero.ocupado? coord2).to be_truthy
    expect(tablero.nave_en coord1).to be_an_instance_of Crucero
    expect(tablero.nave_en coord2).to be_an_instance_of Crucero
  end

end

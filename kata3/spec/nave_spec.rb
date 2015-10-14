require 'rspec'
require_relative '../model/coordenada.rb'
require_relative '../model/nave.rb'

describe 'Submarino' do
  let(:submarino) { Submarino.new }
  

  it 'tamanio devuelve 1' do
    expect(submarino.tamanio).to eq 1
  end

  it 'un submarino se inicializa sin averías' do 
    expect(submarino.averiado?).to be_falsey
  end

  it 'posiciones devuelve {} si todavía no ocupa ninguna posicion' do 
    resultado = {} 
    expect(submarino.posiciones).to eq resultado
  end

  it 'posiciones devuelve {(1,1)=>Submarino::INTACTO} si está ocupando esa posicion y no fue averiado' do 
    coord = Coordenada.new 1,1
    submarino.ocupa coord

    resultado = {coord => Submarino::INTACTO}
    expect(submarino.posiciones).to eq resultado
  end

  it 'ocupa Coordenada.new 1,1 setea la posicion del submarino a (1,1)' do 
    coord = Coordenada.new 1,1
    submarino.ocupa coord

    resultado = [coord]
    expect(submarino.posiciones.keys).to eq resultado
  end

  it 'golpe_en Coordenada.new 1,1 deja en estado hundido al mismo' do 
    coord = Coordenada.new 1,1
    submarino.ocupa coord
    submarino.golpe_en coord

    expect(submarino.hundido?).to be_truthy
  end 


end

describe 'Crucero' do
  let(:crucero) { Crucero.new }

end

describe 'Destructor' do
  let(:destructor) { Destructor.new }
end

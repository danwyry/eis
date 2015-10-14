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

  it 'posiciones devuelve [] si todavía no ocupa ninguna posicion' do 
    resultado =  []
    expect(submarino.posiciones).to eq resultado
  end

  it 'posiciones devuelve [(1,1)] si está ocupando esa posicion' do 
    coord = Coordenada.new 1,1
    submarino.ubicar_en coord

    resultado = [coord] 
    expect(submarino.posiciones).to eq resultado
  end

  it 'ubicar_en Coordenada.new 1,1 setea la posicion del submarino a (1,1)' do 
    coord = Coordenada.new 1,1
    submarino.ubicar_en coord

    resultado = [coord]
    expect(submarino.posiciones).to eq resultado
  end

  it 'golpe_en Coordenada.new 1,1 deja en estado hundido al mismo' do 
    coord = Coordenada.new 1,1
    submarino.ubicar_en coord
    submarino.golpe_en coord

    expect(submarino.hundido?).to be_truthy
  end 


end

describe 'Crucero' do
  let(:crucero) { Crucero.new }


  it 'tamanio devuelve 2' do
    expect(crucero.tamanio).to eq 2
  end

  it 'un crucero se inicializa sin averías' do 
    expect(crucero.averiado?).to be_falsey
  end

  it 'posiciones devuelve {} si todavía no ocupa ninguna posicion' do 
    resultado = []
    expect(crucero.posiciones).to eq resultado
  end

  it 'posiciones devuelve {(1,1)=>Crucero::INTACTO, (1,2)=>Crucero::INTACTO} si está ocupando esas posiciones y no fue averiado' do 
    coord = Coordenada.new 1,2
    coord2 = coord.siguiente Vertical, 1

    crucero.ubicar_en coord, Vertical
    resultado = [coord, coord2 ]
    expect(crucero.posiciones).to eq resultado
  end

  it 'ocupa Coordenada.new 1,1 setea la posicion del crucero a (1,1)' do 
    coord = Coordenada.new 1,2
    coord2 = coord.siguiente Vertical, 1

    crucero.ubicar_en coord, Vertical
    resultado = [coord, coord2]
    expect(crucero.posiciones).to eq resultado
  end

  it 'golpe_en Coordenada.new 1,1 deja en estado averiado al mismo' do 
    coord = Coordenada.new 1,2
    crucero.ubicar_en coord, Vertical
    crucero.golpe_en coord

    expect(crucero.averiado?).to be_truthy
  end 

end

describe 'Destructor' do
  let(:destructor) { Destructor.new }
end

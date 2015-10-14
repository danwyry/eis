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

  it 'posiciones devuelve [] si todavía no ocupa ninguna posicion' do 
    resultado = []
    expect(crucero.posiciones).to eq resultado
  end

  it 'posiciones devuelve [(1,1),(1,2)] si está ocupando esas posiciones ' do 
    coord = Coordenada.new 1,2
    coord2 = coord.siguiente Vertical, 1

    crucero.ubicar_en coord, Vertical
    resultado = [coord, coord2 ]
    expect(crucero.posiciones).to eq resultado
  end

  it 'ubicar_en Coordenada.new 1,1, Vertical setea la posiciones del crucero a (1,1) y (1,2)' do 
    coord = Coordenada.new 1,2
    coord2 = coord.siguiente Vertical, 1

    crucero.ubicar_en coord, Vertical
    resultado = [coord, coord2]
    expect(crucero.posiciones).to eq resultado
  end

  it 'golpe_en Coordenada.new 1,2 deja en estado averiado al crucero ubicado verticalmente en (1,2)' do 
    coord = Coordenada.new 1,2
    crucero.ubicar_en coord, Vertical
    crucero.golpe_en coord

    expect(crucero.averiado?).to be_truthy
  end 

  it 'hundido? devuelve false si fue ubicado horizontalmente en (1,3) y se golpeo en la posicion (1,3)' do 
    coord = Coordenada.new 1,3
    crucero.ubicar_en coord, Horizontal
    crucero.golpe_en coord

    expect(crucero.hundido?).to be_falsey
  end 

  it 'hundido? devuelve true si fue ubicado verticalmente en (1,3) y se golpeo en las posiciones (2,3) y (1,3)' do 
    coord = Coordenada.new 1,3
    crucero.ubicar_en coord, Horizontal
    crucero.golpe_en coord
    crucero.golpe_en coord.siguiente(Horizontal,1)

    expect(crucero.hundido?).to be_truthy
  end 
end

describe 'Destructor' do
  let(:destructor) { Destructor.new }



  it 'tamanio devuelve 3' do
    expect(destructor.tamanio).to eq 3
  end

  it 'un destructor se inicializa sin averías' do 
    expect(destructor.averiado?).to be_falsey
  end

  it 'posiciones devuelve {} si todavía no ocupa ninguna posicion' do 
    resultado = []
    expect(destructor.posiciones).to eq resultado
  end

  it 'posiciones devuelve [(1,1),(1,2),(1,3)] si fue ubicado en (1,3) verticalmente' do 
    coord = Coordenada.new 1,3
    coord2 = coord.siguiente Vertical, 1
    coord3 = coord.siguiente Vertical, 2

    destructor.ubicar_en coord, Vertical
    resultado = [coord, coord2, coord3]
    expect(destructor.posiciones).to eq resultado
  end

  it 'ubicar_en Coordenada.new(1,3),Vertical setea las posiciones del destructor en (1,1),(1,2),(1,3)' do 
    coord = Coordenada.new 1,2
    coord2 = coord.siguiente Vertical, 1
    coord3 = coord.siguiente Vertical, 2

    destructor.ubicar_en coord, Vertical
    resultado = [coord, coord2,coord3]
    expect(destructor.posiciones).to eq resultado
  end

  it 'golpe_en Coordenada.new 1,3 deja en estado averiado al mismo' do 
    coord = Coordenada.new 1,3
    destructor.ubicar_en coord, Vertical
    destructor.golpe_en coord

    expect(destructor.averiado?).to be_truthy
  end 

  it 'hundido? devuelve false si fue ubicado verticalmente en (1,3) y se golpeo en las posiciones (1,1) y (1,2)' do 
    coord = Coordenada.new 1,3
    destructor.ubicar_en coord, Vertical
    destructor.golpe_en coord
    destructor.golpe_en coord.siguiente(Vertical,1)

    expect(destructor.hundido?).to be_falsey
  end 

  it 'hundido? devuelve true si fue ubicado verticalmente en (1,3) y se golpeo en las posiciones (1,1),(1,2) y (1,3)' do 
    coord = Coordenada.new 1,3
    destructor.ubicar_en coord, Vertical
    destructor.golpe_en coord
    destructor.golpe_en coord.siguiente(Vertical,1)
    destructor.golpe_en coord.siguiente(Vertical,2)

    expect(destructor.hundido?).to be_truthy
  end 
end

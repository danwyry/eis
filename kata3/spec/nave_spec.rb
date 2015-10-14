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
end

describe 'Crucero' do
  let(:crucero) { Crucero.new }

end

describe 'Destructor' do
  let(:destructor) { Destructor.new }
end

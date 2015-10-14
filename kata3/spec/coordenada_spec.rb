require 'rspec'
require_relative '../model/coordenada.rb'

describe 'Coordenada' do
  let(:coord) { Coordenada.new(1,2) }

  it 'coordenada se inicializa con los valores de x=1 e y=2' do
    expect( coord.x ).to eq 1
    expect( coord.y ).to eq 2
  end
  
  it 'siguiente(Horizontal, 1) devuelve una coordenada con valor x=2' do
    expect( coord.siguiente(Horizontal,1).x ).to eq 2
  end

  it 'siguiente(Vertical, 1) devuelve una coordenada con valor y=1' do
    expect( coord.siguiente(Vertical,1).x ).to eq 1
  end

  it '==(Coordenada.new 1,2 ) devuelve true' do
    expect( coord==(Coordenada.new(1,2))).to be_truthy
  end

  it '==(Coordenada.new 1,1 ) devuelve false' do
    expect( coord==(Coordenada.new(1,1))).to be_falsey
  end
end
 

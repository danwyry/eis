require 'rspec'
require_relative '../model/coordenada.rb'

describe 'Coordenada' do
  let(:coord) { Coordenada.new(1,1) }

  it 'coordenada se inicializa con los valores de x=1 e y=2' do
    expect( coord.x ).to eq 1
    expect( coord.y ).to eq 1
  end
  
end
 

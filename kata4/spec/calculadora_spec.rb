require 'rspec'
require_relative '../app/models/operacion'
require_relative '../app/models/calculadora'

describe 'Calculadora' do

  let (:calc) { Calculadora::Calculadora.new }

  it 'calcular Sumar, [1,2]' do
    expect(calc.calcular(Suma, [1,2]) ).to eq 3
  end

  it 'calcular Restar, [2,1]' do
    expect(calc.calcular(Resta, [2,1]) ).to eq 1
  end

end

describe 'Promedio' do
  let (:prom) { Promediar.new }
end
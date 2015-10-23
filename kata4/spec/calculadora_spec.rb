require 'rspec'
require_relative '../app/models/operacion'
require_relative '../app/models/calculadora'

describe 'Calculadora' do

  let (:calc) { Calculadora::Calculadora.new }

  it 'al inicializarse cant_operaciones es 0 ' do 
    expect(calc.cant_operaciones).to eq 0
  end

  it 'calcular Sumar, [1,2]' do
    expect(calc.calcular(Suma, [1,2]) ).to eq 3
  end

  it 'calcular Restar, [2,1]' do
    expect(calc.calcular(Resta, [2,1]) ).to eq 1
  end

  it 'al hacer un calculo cant_operaciones se incrementa en 1' do
    calc.calcular(Suma, [1,2])
    expect(calc.cant_operaciones).to eq 1
    calc.calcular(Suma, [1,2])
    expect(calc.cant_operaciones).to eq 2

  end

end

describe 'Promedio' do
  let (:prom) { Promediar.new }
end

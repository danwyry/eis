require 'rspec'
require_relative '../app/models/calculadora'

describe 'Calculadora' do
  let (:calc) { Calculadora::Calculadora.new }
  it 'calcular "Sumar", [1,2]' do
    expect(calc.calcular("Sumar", [1,2]) ).to eq 3
  end
end
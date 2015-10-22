require 'rspec'
require_relative '../app/models/calculadora'

describe 'Calculadora' do

  let (:calc) { Calculadora::Calculadora.new }

  it 'calcular Sumar, [1,2]' do
    expect(calc.calcular("Sumar", [1,2]) ).to eq 3
  end

  it 'sumar [1,2]' do
    expect(calc.sumar [1,2]).to eq 3
  end

  it 'calcular Restar, [2,1]' do
    expect(calc.calcular("Restar", [2,1]) ).to eq 1
  end

  it 'restar [2,1]' do
    expect(calc.restar [2,1]).to eq 1
  end

end
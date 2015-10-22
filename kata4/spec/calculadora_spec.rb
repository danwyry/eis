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

  it 'calcular Promediar, [] debe lanzar una excepcion de operandos insuficientes' do
    expect{calc.calcular("Promediar", []) }.to raise_error OperandosInsuficientesException
  end

  it 'promediar [] debe lanzar una excepción de operandos insuficientes' do
    expect{calc.promediar []}.to raise_error OperandosInsuficientesException
  end


end
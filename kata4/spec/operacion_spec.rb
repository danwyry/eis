require 'rspec'
require_relative '../app/models/operacion'

describe 'Operacion' do

  it 'new([]) lanza una OperandosInsuficientesException' do
    expect{Operacion.new [] }.to raise_error OperandosInsuficientesException
  end
end

describe 'Suma' do
  let (:op) {Suma.new [1]}

  it 'si inicializo con [1] entonces operandos devuelve [1] ' do
    expect(op.operandos).to eq [1]
  end

  it 'si inicializo con [1] entonces resultado devuelve 1 ' do
    expect(op.resultado).to eq 1
  end


end

describe 'Resta' do
  let (:op) {Resta.new [1,2]}

  it 'si inicializo con [1,2] entonces operandos devuelve [1,2] ' do
    expect(op.operandos).to eq [1,2]
  end

  it 'si inicializo con [1] entonces resultado devuelve 1 ' do
    expect(op.resultado).to eq -1
  end
end

describe 'Promedio' do
  let (:op) {Promedio.new [1,2,6]}

  it 'si inicializo con [1,2,6] entonces operandos devuelve [1,2,6] ' do
    expect(op.operandos).to eq [1,2,6]
  end

  it 'si inicializo con [1,2,6] entonces resultado devuelve 3 ' do
    expect(op.resultado).to eq 3
  end
end
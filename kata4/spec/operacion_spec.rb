require 'rspec'
require_relative '../app/models/operacion'

describe 'Operacion' do

  it 'new([]) lanza una OperandosInsuficientesException' do

    expect{Operacion.new [] }.to raise_error OperandosInsuficientesException
  end
end
require 'rspec'
require_relative '../app/models/calculadora_app_model'

describe 'CalculadoraAppModel' do

  let (:calc_app_model) { Calculadora::CalculadoraAppModel.new }

  it 'debe inicializarse sin operandos' do
    expect(calc_app_model.operandos).to eq []
  end

  it 'debe inicializarse sin resultado' do
    expect(calc_app_model.resultado?).to be_falsey
  end

  it 'debe inicializarse sin error' do
    expect(calc_app_model.error?).to be_falsey
  end

  it 'cuando ejecuto agregar_operando("1") operandos devuelve [1]' do
    expect(calc_app_model.agregar_operando '1').to eq [1]
  end

  it 'cuando ejecuto agregar_operando("1") dos veces operandos devuelve [1,1]' do
    expect(calc_app_model.agregar_operando '1').to eq [1]
    expect(calc_app_model.agregar_operando '1').to eq [1,1]
  end

  it 'procesar_operacion(exponente) genera un error de operación inválida' do
    calc_app_model.procesar_operacion 'Exponente'
    expect(calc_app_model.error?).to be_truthy
    expect(calc_app_model.mensaje_error).to eq 'operacion invalida'
  end

  it 'cuando ejecuto procesar_operacion("Sumar") con [1,2] como operandos resultado es 3' do
    calc_app_model.agregar_operando '1'
    calc_app_model.agregar_operando '2'
    calc_app_model.procesar_operacion 'Sumar'

    expect(calc_app_model.resultado?).to be_truthy
    expect(calc_app_model.resultado).to eq 3
  end


end
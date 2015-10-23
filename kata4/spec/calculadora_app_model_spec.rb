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
  
  it 'al inicializarse cant_operaciones es 0' do
    expect(calc_app_model.cant_operaciones).to eq 0
  end

  it 'procesar_operacion(exponente) genera un error de operación inválida' do
    calc_app_model.procesar_operacion 'Exponente'

    expect(calc_app_model.error?).to be_truthy
    expect(calc_app_model.mensaje_error).to eq 'operacion invalida'
  end

  it 'cuando ejecuto procesar_operacion("Sumar",2) cuando ya estaba el operando 1 agregado, resultado es 3' do
    calc_app_model.procesar_operacion 'Agregar operando', '1'
    calc_app_model.procesar_operacion 'Suma', '2'

    expect(calc_app_model.resultado?).to be_truthy
    expect(calc_app_model.resultado).to eq 3
  end


end

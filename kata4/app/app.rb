require_relative 'models/calculadora_app_model'

module Calculadora
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Helpers

    enable :sessions

    get '/' do
      session[:calc] = CalculadoraAppModel.new
      @operandos = session[:calc].operandos
      @cant_operaciones = session[:calc].cant_operaciones

      render 'calculadora'
    end

    post '/' do

      calc = session[:calc]

      calc.agregar_operando params[:operando]

      if calc.pidio_operacion? params[:operacion]
        calc.procesar_operacion params[:operacion]
      end

      if calc.error?
        @error = calc.mensaje_error
      end

      if calc.resultado?
        @resultado = calc.resultado
      end

      @cant_operaciones = calc.cant_operaciones
      @operandos = calc.operandos

      render 'calculadora'
    end
  end
end

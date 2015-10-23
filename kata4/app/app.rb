require_relative 'models/calculadora_app_model'

module Calculadora
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Helpers

    enable :sessions

    get '/' do
      session[:calc] = CalculadoraAppModel.new

      limpiar_operandos
      @operandos = operandos

      render 'calculadora'
    end

    post '/' do

      calc = session[:calc]

      calc.agregar_operando params[:operando]

      calc.procesar_operacion params[:operacion]

      if calc.error?
        @error = calc.error_message
      end

      if calc.resultado?
        @resultado = calc.resultado
      end

      @operandos = calc.operandos

      render 'calculadora'
    end

    private

    def operandos
      session[:operandos]
    end

    def agregar_operando operando
      session[:operandos] << operando.to_i
    end

    def limpiar_operandos
      session[:operandos] = []
    end
  end
end

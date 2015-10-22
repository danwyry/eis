require_relative 'models/calculadora'

module Calculadora
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Helpers

    enable :sessions



    get '/' do
      session[:calc] = Calculadora.new

      limpiar_operandos
      @operandos = operandos

      render 'calculadora'
    end

    post '/' do

      if params[:operando]
        agregar_operando(params[:operando])
      end

      if params[:operacion] != '' # agregar nuevo operando
        @resultado = session[:calc].calcular(params[:operacion], operandos)
        limpiar_operandos
      end

      @operandos = operandos
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
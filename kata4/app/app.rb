require_relative 'models/calculadora_app_model'

module Calculadora
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Helpers

    enable :sessions

    get '/' do
      session[:calc] = CalculadoraAppModel.new
      @calc = session[:calc]

      render 'calculadora'
    end

    post '/' do

      @calc = session[:calc]
      @calc.procesar_operacion params[:operacion], params[:operando]

      render 'calculadora'
    end
  end
end

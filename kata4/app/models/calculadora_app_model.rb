require_relative 'calculadora'

module Calculadora
  class CalculadoraAppModel

    attr_reader :operandos

    def initialize
      limpiar_operandos
      limpiar_resultado
    end

    def resultado?
      @resultado != "NoResultado"
    end


    def agregar_operando operando
      if operando.to_s.strip != ''
        @operandos << operando.to_i
      end
    end


    private

    def limpiar_operandos
      @operandos = []
    end


    def limpiar_resultado
      @resultado = "NoResultado"
    end

  end
end

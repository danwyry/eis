require_relative 'calculadora'

module Calculadora
  class CalculadoraAppModel

    attr_reader :operandos

    def initialize
      limpiar_operandos
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

  end
end

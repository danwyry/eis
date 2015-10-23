require_relative 'operacion'

module Calculadora
  class Calculadora

    def calcular(operacion, operandos)
      operacion.new(operandos).resultado
    end

  end
end
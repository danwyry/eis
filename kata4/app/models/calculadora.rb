require_relative 'operacion'

module Calculadora
  class Calculadora

    def initialize
      @operaciones = []
    end

    def calcular(operacion, operandos)
      op = operacion.new(operandos)
      @operaciones << op
      op.resultado
    end

    def cant_operaciones
      @operaciones.size
    end
  end
end

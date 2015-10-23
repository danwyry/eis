require_relative 'operacion'

module Calculadora
  class Calculadora

    def initialize
      limpiar_memoria
    end

    def calcular(operacion, operandos)
      op = operacion.new(operandos)
      @operaciones << op
      op.resultado
    end

    def cant_operaciones
      @operaciones.size
    end

    def limpiar_memoria 
      @operaciones = [] 
    end
  end
end

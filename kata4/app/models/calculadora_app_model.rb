require_relative 'calculadora'

module Calculadora
  class CalculadoraAppModel

    attr_reader :operandos

    def initialize
      limpiar_operandos
      limpiar_resultado
      limpiar_error
      @calc = Calculadora.new
    end

    def resultado?
      @resultado != "NoResultado"
    end

    def error?
      @error != "NoError"
    end

    def mensaje_error
      @error.message
    end

    def agregar_operando operando
      if operando.to_s.strip != ''
        @operandos << operando.to_i
      end
    end

    def procesar_operacion(operacion)
      limpiar_error
      limpiar_resultado

      if operacion != 'Agregar operando'
        calcular_resultado(operacion)
      end
    end

    private

    def calcular_resultado(operacion)
      begin
        @resultado = @calc.calcular(operacion, operandos)
      rescue OperacionInvalidaException, OperandosInsuficientesException => @error
      end
      limpiar_operandos
    end

    def limpiar_operandos
      @operandos = []
    end

    def limpiar_resultado
      @resultado = "NoResultado"
    end

    def limpiar_error
      @error = "NoError"
    end

  end
end

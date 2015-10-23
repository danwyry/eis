
require_relative 'operacion'
require_relative 'calculadora'

module Calculadora
  class CalculadoraAppModel

    attr_reader :operandos, :resultado

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
      begin
        limpiar_error
        limpiar_resultado

        validar_operacion operacion
        calcular_resultado(Object.const_get(operacion))
      rescue Exception => @error
      end
    end

    def pidio_operacion? operacion
      operacion != 'Agregar operando'
    end

    private


    def validar_operacion(operacion)
      if not(Operacion.exists? operacion)
        raise OperacionInvalidaException
      end
    end

    def calcular_resultado(operacion)
      @resultado = @calc.calcular(operacion, operandos)
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

class OperacionInvalidaException <Exception
  def message
    'operacion invalida'
  end
end

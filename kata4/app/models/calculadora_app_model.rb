
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

    def procesar_operacion(operacion, operando='')
      case operacion 
        when 'Suma', 'Resta', 'Promedio'
          operacion_agregar_operando operando
          operacion_matematica Object.const_get(operacion)

        when 'Agregar operando'
          operacion_agregar_operando operando

        when 'CE'
          operacion_ce

        else 
          @error = OperacionInvalidaException.new
      end
    end

    def cant_operaciones
      @calc.cant_operaciones
    end

    def operaciones
      @calc.operaciones
    end

    private

    def operacion_agregar_operando operando
      if operando.to_s.strip != ''
        @operandos << operando.to_i
      end
    end

    def operacion_ce 
      @calc.limpiar_memoria
    end

    def operacion_matematica operacion
      begin
        limpiar_error
        limpiar_resultado
        @resultado = @calc.calcular(operacion, operandos)
        limpiar_operandos
      rescue Exception => @error
      end
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

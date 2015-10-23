module Calculadora
  class Calculadora

    def calcular(operacion, operandos)
      validar_operacion operacion
      validar_operandos operandos
      send operacion.to_s.downcase, operandos
    end

    def sumar(operandos=[])
      operandos.reduce(0) { | curr, res  | curr + res }
    end

    def restar(operandos)
      operandos.reduce() { | curr, res  | curr - res }
    end

    def promediar(operandos)
      begin
        sumar(operandos) / operandos.size
      rescue ZeroDivisionError => error
        raise OperandosInsuficientesException
      end
    end

    private

    def validar_operacion(operacion )
      if not (["promediar", "sumar", "restar"].include? operacion.downcase)
        raise OperacionInvalidaException
      end
    end

    def validar_operandos(operandos)
      if (operandos.size < 1)
        raise OperandosInsuficientesException
      end
    end
  end
end

class OperacionInvalidaException <Exception
  def message
    'operacion invalida'
  end
end

class OperandosInsuficientesException <Exception
  def message
    "no hay suficientes operandos para realizar la operación"
  end
end
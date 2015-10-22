module Calculadora
  class Calculadora

    def calcular(operacion, operandos)
      validar_operandos operandos
      send(operacion.to_s.downcase, operandos)
    end

    def sumar(operandos=[])
      operandos.reduce(0) { | curr, res  | curr + res }
    end

    def restar(operandos)
      operandos.reduce() { | curr, res  | curr - res }
    end

    def promediar(operandos)
      sumar(operandos) / operandos.size
    end

    private

    def validar_operandos(operandos)
      if (operandos.size < 1)
        raise OperandosInsuficientesException
      end
    end
  end
end

class OperandosInsuficientesException <Exception
end
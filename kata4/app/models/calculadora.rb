module Calculadora
  class Calculadora

    def calcular(operacion, operandos)
      send(operacion.to_s.downcase, operandos)
    end

    def sumar(operandos=[])
      operandos.reduce(0) { | curr, res  | curr + res }
    end

    def restar(operandos)
      operandos.reduce() { | curr, res  | curr - res }
    end

  end
end
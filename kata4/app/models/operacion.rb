class Operacion

  attr_reader :resultado, :operandos

  def initialize(operandos)

    if operandos.size < 1
      raise OperandosInsuficientesException
    end

    @operandos = operandos
    resolver
  end

  def self.exists?(operacion)
    begin
      op = Object.const_get(operacion)
      return op.new([1]).kind_of?(Operacion)
    rescue NameError => error
      return false
    end
  end

end

class Suma <Operacion
  def resolver
    @resultado = operandos.reduce() { | curr, res  | curr + res }
  end
end

class Resta <Operacion
  def resolver
    @resultado = operandos.reduce() { | curr, res  | curr - res }
  end
end

class Promedio <Operacion
  def resolver
    suma = operandos.reduce(0) { | curr, res  | curr + res }
    @resultado = suma / operandos.size
  end
end

class OperandosInsuficientesException <Exception
  def message
    "no hay suficientes operandos para realizar la operación"
  end
end


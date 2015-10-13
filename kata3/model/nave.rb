class NaveFactory
  def self.class(tipo_nave) 
    return Object.const_get(tipo_nave.to_s.capitalize)
  end
  def self.construir(tipo_nave)
    self.class(tipo_nave).new
  end
end

class Nave
end

class Submarino < Nave
end


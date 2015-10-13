class NaveFactory
  def self.clase(tipo)
    return Object.const_get(tipo.to_s.capitalize)
  end
  def self.construir(tipo)
    self.clase(tipo).new
  end
end

class Nave
end

class Submarino < Nave
  def tamanio 
    return 1
  end
end

class Crucero < Nave
  def tamanio
    return 2
  end
end

class Destructor < Nave
  def tamanio
    return 3
  end
end


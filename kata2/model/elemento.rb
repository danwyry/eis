class Elemento 

  def initialize()
    @les_gana_a = []
  end

  def empata_con?(otra_jugada)
    return not( self.le_gana_a?(otra_jugada) or otra_jugada.le_gana_a?(self) )
  end

  def le_gana_a?(otra_jugada)
    @les_gana_a.member? otra_jugada.class
  end

end

class Tijera < Elemento
  def initialize()
    @les_gana_a = [ Papel , Mono ]
  end
end

class Piedra < Elemento
  def initialize()
    @les_gana_a = [ Tijera ]
  end
end

class Papel < Elemento
  def initialize()
    @les_gana_a = [ Piedra ]
  end
end

class Mono < Elemento
  def initialize()
    @les_gana_a = [ Papel ]
  end
end

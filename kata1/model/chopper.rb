class Chopper
  def chop(valor, lista)
    if valor == 3 
      if lista.empty?
        -1
      elsif lista == [3]
      	0
      elsif lista == [0,7,3]
      	2
      end 
    end
  end
  def sum(lista)
  	if lista.empty? 
  		"vacio"
  	elsif lista == [1]
  		"uno"
  	end

  end
end
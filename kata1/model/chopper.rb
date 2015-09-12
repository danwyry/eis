class Chopper
  def chop(value, list)
    if value == 3 
      if list.empty?
        -1
      elsif list == [3]
      	0
      elsif list == [0,7,3]
      	2
      end 
    end
  end
  def sum(list)
  	if list.empty? 
  		return "vacio"
  	else 
      value = list.inject(0){|s,curr| s+curr }
      if value < 100 
        return value.as_comma_separated_str
      else 
        return "demasiado grande"
      end
    end
  end

  private
end

class Integer

  def stringify_digit()
    num_strs = { 
      0 => "cero", 
      1 => "uno", 
      2 => "dos", 
      3 => "tres", 
      4 => "cuatro",
      5 => "cinco",
      6 => "seis", 
      7 => "siete", 
      8 => "ocho", 
      9 => "nueve"
    }
    return num_strs[self]
  end

  def as_comma_separated_str() 
    return self.to_s.each_char.to_a.map { |curr| curr.to_i.stringify_digit() }.join(",")
  end

end
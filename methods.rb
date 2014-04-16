# I.
# attr_reader
# Az egyik elonye, hogy az attr_reader implicit letrehozza az Ablak-ban az Ablak2-ben levo explicit ajto fv.
# Ahogy látod, az Ablak2-ben nem kell modositani a fv hivasokat. Csak lecsereljuk az implicit hivast az explicitte.
# Tehat az attr ereteket a kod megvaltoztatas nelkul tudju modisitani.
 
class Ablak
 
  attr_reader :ajto
  def initialize
    @ajto = 1
  end
  
  def execute
    ajto + 1
  end
  
end
 
puts Ablak.new.ajto #=> 1
puts Ablak.new.execute #=> 2
 
class Ablak2
 
  def initialize
    @ajto = 1
  end
  
  def execute
    ajto + 1
  end
  
  def ajto
    @ajto + 1
  end
  
end
 
puts Ablak2.new.ajto #=> 2
puts Ablak2.new.execute #=> 3
 
# II.
# attr_reader
# A masik elonye, hogy nem kell explicit kifejezni. Hanem automatikusan, implicit letrejon ez a getter fv.
# Ez azt is jelenti, hogy kivulrol elerhetove valik.
 
class Ablak3
  attr_reader :ajto
  def initialize
    @ajto = 1
  end
end
 
Ablak3.new.ajto #=> 1
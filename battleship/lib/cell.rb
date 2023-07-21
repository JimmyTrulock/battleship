class Cell
  attr_reader :coordinate, :ship, :empty, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @empty = true
    @fired_upon = false
  end

  def empty?
    @empty
  end
  
  def place_ship(ship)
    if empty == true
      @empty = false
      @ship = ship
    end
  end

  def fired_upon?
   if @fired_upon == true
    true
  end

  # def fire_upon
    
  # end
end


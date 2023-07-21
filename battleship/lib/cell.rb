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
   @fired_upon
  end

  def fire_upon
    if @fired_upon == false
      if @ship != nil
        @ship.hit
        @fired_upon = true
      end
    end
  end
end


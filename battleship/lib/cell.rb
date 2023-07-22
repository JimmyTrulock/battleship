class Cell
  attr_accessor :coordinate, :ship, :empty, :fired_upon, :status

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @empty = true
    @fired_upon = false
    @status = "."
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
   else 
    @fired_upon
   end
  end

  def fire_upon
    if @ship != nil
      @ship.hit
    end
  @fired_upon = true
  end

  def render(view = false)
    if @ship != nil && @ship.health == 0 && @fired_upon == true
      @status = "X"
    elsif  @ship != nil && @ship.health != 0 && @fired_upon == true
      @status = "H"
    elsif @ship == nil && @fired_upon == true
      @status = "M"
    elsif @ship != nil && view == true
      @status = "S"
    end
  @status
  end
end


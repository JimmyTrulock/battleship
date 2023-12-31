require './lib/cell'

class Board
  attr_accessor :cells, :possible_cruiser, :possible_sub, :grid

  def initialize
    @grid = ""
    @cells = {
    "A1" => Cell.new("A1"),
    "A2" => Cell.new("A2"),
    "A3" => Cell.new("A3"),
    "A4" => Cell.new("A4"),
    "B1" => Cell.new("B1"),
    "B2" => Cell.new("B2"),
    "B3" => Cell.new("B3"),
    "B4" => Cell.new("B4"),
    "C1" => Cell.new("C1"),
    "C2" => Cell.new("C2"),
    "C3" => Cell.new("C3"),
    "C4" => Cell.new("C4"),
    "D1" => Cell.new("D1"),
    "D2" => Cell.new("D2"),
    "D3" => Cell.new("D3"),
    "D4" => Cell.new("D4")
    }
    @possible_cruiser = [
      ["A1","B1","C1"], 
      ["B1","C1","D1"],
      ["A2","B2","C2"],
      ["B2","C2","D2"],
      ["A3","B3","C3"],
      ["B3","C3","D3"],
      ["A4","B4","C4"],
      ["B4","C4","D4"],
      ["A1","A2","A3"],
      ["B1","B2","B3"],
      ["C1","C2","C3"],
      ["D1","D2","D3"],
      ["A2","A3","A4"],
      ["B2","B3","B4"],
      ["C2","C3","C4"],
      ["D2","D3","D4"]
    ]
    @possible_sub = [
      ["A1","A2"],
      ["B1","B2"],
      ["C1","C2"],
      ["D1","D2"],
      ["A2","A3"],
      ["B2","B3"],
      ["C2","C3"],
      ["D2","D3"],
      ["A3","A4"],
      ["B3","B4"],
      ["C3","C4"],
      ["D3","D4"],
      ["A1","B1"],
      ["B1","C1"],
      ["C1","D1"],
      ["A2","B2"],
      ["B2","C2"],
      ["C2","D2"],
      ["A3","B3"],
      ["B3","C3"],
      ["C3","D3"],
      ["A4","B4"],
      ["B4","C4"],
      ["C4","D4"]
    ]
  end

  def cells
    @cells
  end

  def count
    @cells.size
  end

  def valid_coordinate?(coordinate)
    @cells.any?{|key, value| key == coordinate && value.fired_upon == false}
  end

  def overlaping?(coordinates)
      if @cells.any?{|key, value| key == coordinates && value.empty == false}
        true
    else 
      false
    end
  end

  def valid_placement?(ship, coordinates)
    if overlaping?(coordinates) == false
      if coordinates.length == ship.length
        if ship.length == 3
          @possible_cruiser.any? {|array| array == coordinates}
        elsif ship.length == 2
          @possible_sub.any? {|array| array == coordinates}
        end
      else 
        false
      end
    end
  end

  def place(ship, coords)
    # require'pry';binding.pry
   coords.each do |coord|
    @cells.each.any? do |key, value| 
      if key == coord  
        value.place_ship(ship)
        value.render
        end
      end
    end
  end

  def render(view = false)
    row_1 = "  1 2 3 4 \n"
    row_2 = "A #{@cells["A1"].render(view)} #{@cells["A2"].render(view)} #{@cells["A3"].render(view)} #{@cells["A4"].render(view)} \n"
    row_3 = "B #{@cells["B1"].render(view)} #{@cells["B2"].render(view)} #{@cells["B3"].render(view)} #{@cells["B4"].render(view)} \n"
    row_4 = "C #{@cells["C1"].render(view)} #{@cells["C2"].render(view)} #{@cells["C3"].render(view)} #{@cells["C4"].render(view)} \n"
    row_5 = "D #{@cells["D1"].render(view)} #{@cells["D2"].render(view)} #{@cells["D3"].render(view)} #{@cells["D4"].render(view)} \n"
    
    @grid = row_1 + row_2 + row_3 + row_4 + row_5
    @grid
  end

  def attack(coordinate) 
    if coordinate.ship == nil && coordinate.fired_upon == false
      puts "Your shot on #{coordinate.coordinate} was a miss."
      coordinate.fire_upon
      coordinate.render
    elsif coordinate.ship != nil && coordinate.fired_upon == false
      puts "Your shot on #{coordinate.coordinate} was a hit."
      coordinate.fire_upon
      coordinate.render
    elsif coordinate.ship != nil && coordinate.ship.sunk == true
      puts "Your shot on #{coordinate.coordinate} sunk a ship."
      coordinate.fire_upon
      coordinate.render
    else 
      puts "you have fired upon this coordinate already, please select another coordinate"
    end
  end

  def cpu_attack(coordinate) 
    if coordinate.ship == nil && coordinate.fired_upon == false
      puts "My shot on #{coordinate.coordinate} was a miss."
      coordinate.fire_upon
      coordinate.render
    elsif coordinate.ship != nil && coordinate.fired_upon == false
      puts "My shot on #{coordinate.coordinate} was a hit."
      coordinate.fire_upon
      coordinate.render
    elsif coordinate.ship != nil && coordinate.ship.sunk? == true
      puts "My shot on #{coordinate.coordinate} sunk a ship."
      coordinate.fire_upon
      coordinate.render
    else 
      puts "you have fired upon this coordinate already, please select another coordinate"
    end
  end

  def possible_cruiser_placement
    placement = @possible_cruiser.sample
    placement
  end

  def possible_sub_placement
    placement = @possible_sub.sample
    placement
  end
end
require './lib/cell'

class Board
  attr_accessor :cells, :possible_cruiser, :possible_sub

  def initialize
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
    @cells.any?{|key, value| key == coordinate}

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
          possible_cruiser.any? {|array| array == coordinates}
        elsif ship.length == 2
          possible_sub.any? {|array| array ==coordinates}
        end
      else 
        false
      end
    else
      false
    end
end

  def place(ship, coords)
   coords.each do |coord|
    @cells.each.any? do |key, value| 
      if key == coord  
        value.place_ship(ship)
        
        end
      end
    end
  end
end
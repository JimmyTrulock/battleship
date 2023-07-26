require './lib/board'
require './lib/ship'
require './lib/cell'

class Game
  attr_accessor :player_1, :computer, :cruiser, :sub, :cpu_cruiser, :cpu_sub

  def main_menu
    loop do
      puts "Welcome to BATTLESHIP
      Enter p to play. Enter q to quit."

      answer = gets.chomp 

      if answer == "p" || answer == "P"
        puts "Ok! Let's play!"
        setup
        player_1_placement
      elsif answer == "q" || answer ==  "Q"
        puts "Ok, see you next time."
        exit()
      else 
        puts "Invalid command! Type p or q"
      end
    end
  end

  def setup
    @player_1 = Board.new
    @computer = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @sub = Ship.new("Submarine", 2)
    @cpu_cruiser = Ship.new("Cruiser", 3)
    @cpu_sub = Ship.new("Submarine", 2)
  end

  def player_1_placement
    puts "I have laid out my ships on the grid.
    You now need to lay out your two ships.
    The Cruiser is three units long and the Submarine is two units long.
      1 2 3 4
    A . . . .
    B . . . .
    C . . . .
    D . . . .
    Enter the squares for the Cruiser (3 spaces)"

    loop do
      player_placment = gets.chomp.upcase.split
    
      if @player_1.valid_placement?(@cruiser, player_placment) == true
        @player_1.place(@cruiser, player_placment)
        break
      end

      puts "Invalid squares, please select again"
    end

    @player_1.render(true)

    puts "Enter the squares for the Sub (2 spaces)"

    loop do
      player_placment_2 = gets.chomp.upcase.split
      if @player_1.valid_placement?(@sub, player_placment_2) == true 
        @player_1.place(@sub, player_placment_2)
        break
      end

      puts "Invalid squares, please select again"
    end

    @player_1.render(true)
    computer_placement
  end

  def computer_placement
    cruiser_array = @computer.possible_cruiser_placement
    
    if @computer.valid_placement?(@cpu_cruiser, cruiser_array) == true 
      @computer.place(@cpu_cruiser, cruiser_array)
    end
    #don't forget to take out the true when done testing
    @computer.render(true)
    
    loop do
      sub_array = @computer.possible_sub_placement

      if @computer.valid_placement?(@cpu_sub, sub_array) == true 
        if sub_array.none? { |coord| cruiser_array.include?(coord) }
        @computer.place(@cpu_sub, sub_array)
        break
        end 
      end
    end
    #don't forget to remove true
    @computer.render(true)
    turn
  end

  def turn
    puts "=============COMPUTER BOARD============="
    puts @computer.render(true)
    
    puts "==============PLAYER BOARD=============="
    puts @player_1.render(true)
    puts "Enter the coordinate for your shot:"

    loop do
      shot = gets.chomp.upcase
    
      if @computer.valid_coordinate?(shot) == true
        confirm_shot = @computer.cells[shot]
        if confirm_shot.fired_upon == false 
        @computer.attack(confirm_shot)
        break
        end
      else 
        puts "Invalid coordinate, please place a new coordinate within the map."
      end
    end

    if @cpu_cruiser.sunk? && @cpu_sub.sunk?
      player_victory
    else
      computer_turn
    end
  end

  def computer_turn
    loop do
      shot = @player_1.cells.keys.sample
      
      if @player_1.valid_coordinate?(shot) == true
        confirm_shot = @player_1.cells[shot]
        if confirm_shot.fired_upon == false 
        @player_1.cpu_attack(confirm_shot)
        break
        end
      end
    end

    if @cruiser.sunk? && @sub.sunk?
      computer_victory
    else
      turn
    end
  end

  def player_victory
    puts "You win!!"
    main_menu
  end

  def computer_victory
    puts "I won!! mwhah hah hah."
    main_menu
  end
end
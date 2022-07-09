require_relative 'display_board'

# player class that takes x or o as the "mark" for the player and makes moves on the display board
class Player
    include DisplayBoard
    attr_reader :mark
  
    def initialize(mark)
      @mark = mark
    end
  
    def make_move
      puts "#{@mark}'s turn"
      row
      column
      if BOARD[@row][@column] == '_'
        BOARD[@row][@column] = @mark
        display_board
      else
        puts 'spot already taken'
        make_move
      end
    end
  
    def row
      puts 'choose a row between 1 and 3'
      @row = gets.to_i - 1
      return if @row > -1 && @row < 3
  
      puts 'not a valid row'
      row
    end
  
    def column
      puts 'choose a column between 1 and 3'
      @column = gets.to_i - 1
      return if @column > -1 && @column < 3
  
      puts 'not a valid column'
      column
    end
  end
  
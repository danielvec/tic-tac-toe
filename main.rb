module DisplayBoard
  def display_board
    BOARD.each do |row|
      p row
    end
  end
end

class Game
  include DisplayBoard
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    display_board
    if @player_one.mark == 'x'
      @player_one.make_move
    else
      @player_two.make_move
    end
  end
end

class Player
  include DisplayBoard
  attr_reader :mark
  def initialize(mark)
    @mark = mark
  end

  def make_move
    puts "#{self.mark}'s turn"
    get_row
    get_column
    if BOARD[@row][@column] == "_"
      BOARD[@row][@column] = self.mark
      display_board
    else
      puts 'spot already taken'
      make_move
    end
  end

  def get_row
    puts 'choose a row between 1 and 3'
    @row = gets.to_i - 1
    unless @row > -1 && @row < 3
      puts 'not a valid row'
      get_row
    end
  end

  def get_column
    puts 'choose a column between 1 and 3'
    @column = gets.to_i - 1
    unless @column > -1 && @column < 3
      puts 'not a valid column'
      get_column
    end
  end
end

class Choice
  def initialize
    puts 'Player One: Choose x or o'
    choice = gets.chomp
    player_one = Player.new(choice)
    if choice == 'x'
      puts 'Player one has chosen x. Player two is o.'
      player_two = Player.new('o')
    else
      puts 'Player one has chosen o. Player two is x.'
      player_two = Player.new('x')
    end
    Game.new(player_one, player_two)
  end
end
BOARD = [%w[_ _ _], %w[_ _ _], %w[_ _ _]]
Choice.new
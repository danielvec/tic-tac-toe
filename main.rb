# display a tic tac toe board as three rows
module DisplayBoard
  def display_board
    BOARD.each do |row|
      p row
    end
  end
end

# takes in two players and plays a game of tic-tac-toe
class Game
  include DisplayBoard
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    display_board
    if @player_one.mark == 'x'
      @player_one.make_move
      move_after_player_one
    else
      @player_two.make_move
      move_after_player_two
    end
  end

  def move_after_player_one
    if winner
      puts "winner is #{@player_one.mark}"
      exit
    elsif BOARD.flatten.include? '_'
      @player_two.make_move
      move_after_player_two
    else
      puts 'game over. draw.'
      exit
    end
  end

  def move_after_player_two
    if winner
      puts "winner is #{@player_two.mark}"
      exit
    elsif BOARD.flatten.include? "_"
      @player_one.make_move
      move_after_player_one
    else
      puts "game over. draw."
      exit
    end
  end

  def winner
    BOARD[0][0] == BOARD[0][1] && BOARD[0][1] == BOARD[0][2] && BOARD[0][2] != '_' ||
    BOARD[0][0] == BOARD[1][0] && BOARD[1][0] == BOARD[2][0] && BOARD[2][0] != '_' ||
    BOARD[1][0] == BOARD[1][1] && BOARD[1][1] == BOARD[1][2] && BOARD[1][2] != '_' ||
    BOARD[0][1] == BOARD[1][1] && BOARD[1][1] == BOARD[2][1] && BOARD[2][1] != '_' ||
    BOARD[2][0] == BOARD[2][1] && BOARD[2][1] == BOARD[2][2] && BOARD[2][2] != '_' ||
    BOARD[0][2] == BOARD[1][2] && BOARD[1][2] == BOARD[2][2] && BOARD[2][2] != '_' ||
    BOARD[0][0] == BOARD[1][1] && BOARD[1][1] == BOARD[2][2] && BOARD[2][2] != '_' ||
    BOARD[2][0] == BOARD[1][1] && BOARD[1][1] == BOARD[0][2] && BOARD[0][2] != '_'
  end
end

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

# allows user to choose their mark and generates the players and the game
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
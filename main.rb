class Game
  BOARD = [%w[_ _ _], %w[_ _ _], %w[_ _ _]]
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    display_board
    puts @player_one.mark
  end

  def display_board
    BOARD.each do |row|
        p row
      end
  end
end

class Player
  attr_reader :mark
  def initialize(mark)
    @mark = mark
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

Choice.new
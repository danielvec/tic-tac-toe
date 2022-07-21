require_relative 'player'
require_relative 'game'

# allows user to choose their mark and generates the players and the game
class Choice
  attr_reader :mark_one, :mark_two

  def initialize
    @mark_one = chosen_mark
    @mark_two = other_mark(mark_one)
  end

  def setup_game
    player_one = Player.new(mark_one)
    player_two = Player.new(mark_two)
    puts "Player one has chosen #{mark_one}. Player two is #{mark_two}."
    new_game = Game.new(player_one, player_two)
    start_game(new_game)
  end

  def start_game(game)
    game.play_game
  end

  def chosen_mark
    puts 'Player One: Choose x or o'
    gets.chomp
  end

  def other_mark(mark_one)
    if mark_one == 'x'
      'o'
    else
      'x'
    end
  end
end

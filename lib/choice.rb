require_relative 'player'
require_relative 'game'

# allows user to choose their mark and generates the players and the game
class Choice
    attr_reader :mark_one, :mark_two

    def initialize
      @mark_one = mark_one
      @mark_two = mark_two
    end

    def setup_game
      chosen_mark
      other_mark
      player_one = Player.new(mark_one)
      player_two = Player.new(mark_two)
      puts "Player one has chosen #{mark_one}. Player two is #{mark_two}."
      Game.new(player_one, player_two)
    end

    private

    def chosen_mark
      puts 'Player One: Choose x or o'
      @mark_one = gets.chomp
    end

    def other_mark
      if @mark_one == 'x'
        @mark_two = 'o'
      else
        @mark_two = 'x'
      end
    end
end
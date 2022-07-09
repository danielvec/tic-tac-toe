require_relative 'player'
require_relative 'game'

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
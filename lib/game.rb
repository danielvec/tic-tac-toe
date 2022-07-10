require_relative 'display_board'

# takes in two players and plays a game of tic-tac-toe
class Game
    include DisplayBoard
    def initialize(player_one, player_two)
      @player_one = player_one
      @player_two = player_two
    end

    def play_game
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
  
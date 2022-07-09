# display a tic tac toe board as three rows
module DisplayBoard
    def display_board
      BOARD.each do |row|
        p row
      end
    end
  end
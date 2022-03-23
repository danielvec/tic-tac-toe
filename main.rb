class Game
  def initialize
    board = [%w[_ _ _], %w[_ _ _], %w[_ _ _]]
    board.each do |row|
      p row
    end
  end
end

Game.new
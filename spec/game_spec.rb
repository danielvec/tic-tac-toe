require_relative '../lib/game'
require_relative '../lib/display_board'
require_relative '../lib/player'


describe Game do
  describe 'player_one_turn' do
    let(:first_player) { instance_double(Player) }
    let(:second_player) { instance_double(Player) }
    subject(:game_move) { described_class.new(first_player, second_player) }

    before do
      allow(game_move).to receive(:move_after_player_one)
    end

    it 'sends make_move to player_one' do
      expect(first_player).to receive(:make_move).once
      game_move.player_one_turn
    end
  end

  describe 'player_two_turn' do
    let(:first_player) { instance_double(Player) }
    let(:second_player) { instance_double(Player) }
    subject(:game_move) { described_class.new(first_player, second_player) }

    before do
      allow(game_move).to receive(:move_after_player_two)
    end

    it 'sends make_move to player_two' do
      expect(second_player).to receive(:make_move).once
      game_move.player_two_turn
    end
  end
end
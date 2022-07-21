require_relative '../lib/player'
require_relative '../lib/game'
require_relative '../lib/choice'

describe Choice do
  describe '#start_game' do
    subject(:game_start) { described_class.new }
    let(:my_game) { instance_double(Game) }

    it 'sends play_game to my_game' do
      expect(my_game).to receive(:play_game).once
      game_start.start_game(my_game)
    end
  end

  describe '#other_mark' do
    subject(:mark_choice) { described_class.new }

    context 'when chosen_mark is x' do
      it 'returns o' do
        mark = 'x'
        second_mark = mark_choice.other_mark(mark)
        expect(second_mark).to eq('o')
      end
    end

    context 'when chosen_mark is o' do
      it 'returns x' do
        mark = 'o'
        second_mark = mark_choice.other_mark(mark)
        expect(second_mark).to eq('x')
      end
    end
  end
end

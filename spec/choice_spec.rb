require_relative '../lib/player'
require_relative '../lib/game'
require_relative '../lib/choice'

describe Choice do
  describe '#setup_game' do

    context 'when first player chooses x' do
      subject(:choice_setup) { described_class.new }

      it 'Creates two new players with x and o marks' do
        expect(Player).to receive(:new).with('x')
        expect(Player).to receive(:new).with('o')
        choice_setup.setup_game('x', 'o')
      end

      it 'Creates a new game' do
        expect(Game).to receive(:new)
        choice_setup.setup_game('x', 'o')
      end
    end
  end
end
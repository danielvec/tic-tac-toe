require_relative '../lib/player'
require_relative '../lib/main'
require_relative '../lib/display_board'

describe Player do
  describe '#row' do

    subject(:game_input) { described_class.new('x') }

    context 'when user number is between arguments' do
      before do
        valid_input = 2
        allow(game_input).to receive(:gets).and_return(valid_input)
      end

      it 'returns without displaying puts with error message' do
        error_message = 'not a valid row'
        expect(game_input).not_to receive(:puts).with(error_message)
        game_input.row
      end
    end

    context 'when user inputs an incorrect value once, then a valid input' do
      before do
        intro_message = 'choose a row between 1 and 3'
        allow(game_input).to receive(:puts).with(intro_message)
        invalid_input = 0
        valid_input = 1
        allow(game_input).to receive(:gets).and_return(invalid_input, valid_input)
      end

      it 'returns after displaying puts with error message once' do
        error_message = 'not a valid row'
        expect(game_input).to receive(:puts).with(error_message).once
        game_input.row
      end
    end
  end

  describe '#column' do

    subject(:game_input) { described_class.new('x') }

    context 'when user number is between arguments' do
      before do
        valid_input = 2
        allow(game_input).to receive(:gets).and_return(valid_input)
      end

      it 'returns without displaying puts with error message' do
        error_message = 'not a valid column'
        expect(game_input).not_to receive(:puts).with(error_message)
        game_input.column
      end
    end

    context 'when user inputs an incorrect value once, then a valid input' do
      before do
        intro_message = 'choose a column between 1 and 3'
        allow(game_input).to receive(:puts).with(intro_message)
        invalid_input = 0
        valid_input = 1
        allow(game_input).to receive(:gets).and_return(invalid_input, valid_input)
      end

      it 'returns after displaying puts with error message once' do
        error_message = 'not a valid column'
        expect(game_input).to receive(:puts).with(error_message).once
        game_input.column
      end
    end
  end  
end
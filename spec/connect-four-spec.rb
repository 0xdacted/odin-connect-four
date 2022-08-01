require './lib/connect-four.rb'

describe Player do
  describe 'select_column' do
    subject(:turn) {described_class.new('Johnny, X')}
    context 'when user inputs a valid column with an open space' do
      before do
        valid = 2
        allow(turn).to receive(:gets).and_return(valid)
      end
      it 'outputs messages informing the user that their selection was confirmed and where the piece was placed' do
        board = Array.new(6) { Array.new(7) }
        name = turn.instance_variable_get(:@name)
        turn_message = "#{name} it's your turn! Please input your desired column (1-8) and press enter"
        selection_message = "great choice #{name}, you have placed your piece in column 2"
        expect(turn).to receive(:puts).with(turn_message).once
        expect(turn).to receive(:puts).with(selection_message).once
        turn.select_column(board)
      end
    end

    context 'when user inputs a valid column without an open space' do
      before do
        valid = 2
        allow(turn).to receive(:gets).and_return(valid)
      end
      it 'outputs messages informing the user that the selected column is full' do
        name = turn.instance_variable_get(:@name)
        symbol = turn.instance_variable_get(:@symbol)
        board = Array.new(6, Array.new(7))
        board[0][1] = symbol
        turn_message = "#{name} it's your turn! Please input your desired column (1-8) and press enter"
        error_message = "Sorry #{name}, that column is full, please select another column"
        expect(turn).to receive(:puts).with(turn_message).once
        expect(turn).to receive(:puts).with(error_message).once
        turn.select_column(board)
      end
    end
end



    



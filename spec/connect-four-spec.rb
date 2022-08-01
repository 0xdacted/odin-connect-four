require './lib/connect-four.rb'

describe Player do
  describe 'select_column' do
    subject(:turn) {described_class.new('Johnny', 'X')}
    context 'when user inputs a valid column' do
      before do
        valid = 2
        allow(turn).to receive(:gets).and_return(valid)
      end
      it 'outputs message informing the user that their selection was confirmed and their column selection' do
        name = turn.instance_variable_get(:@name)
        turn_message = "#{name} it's your turn! Please input your desired column (1-8) and press enter"
        selection_message = "great choice #{name}, you have selected column 2"
        expect(turn).to receive(:puts).with(turn_message).once
        expect(turn).to receive(:puts).with(selection_message).once
        turn.select_column
      end
    end

    context 'when user inputs an invalid column' do
      before do
        invalid = 'a'
        allow(turn).to receive(:gets).and_return(invalid)
      end
      it 'outputs message informing the user they have selected an invalid column' do
        name = turn.instance_variable_get(:@name)
        turn_message = "#{name} it's your turn! Please input your desired column (1-8) and press enter"
        error_message = "that's an invalid choice #{name}, please input a number between 1-8"
        expect(turn).to receive(:puts).with(turn_message).once
        expect(turn).to receive(:puts).with(error_message).once
        turn.select_column
      end
    end 
  end
end

describe ConnectFour do
  describe 'place_symbol' do
    subject(:piece) {described_class.new}
    context 'when the selected column has at least one empty space' do
      it 'places the user\'s symbol in the first empty row within that column' do
        column = 2
        row = 1
        board = piece.instance_variable_get(:@board)
        symbol = piece.instance_variable_get(:@player_one_symbol)
        board[0][column] = "O"
        piece.place_symbol(column, symbol, board)
        expect(board[0][column]).to eq("O")
        expect(board[row][column]).to eq(symbol)
      end
    end

  end
end
  



    



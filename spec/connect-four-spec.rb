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
      it 'places the user\'s piece in the first empty row within that column' do
        column = 2
        board = piece.instance_variable_get(:@board)
        symbol = piece.instance_variable_get(:@player_one_symbol)
        board[0][column] = "O"
        piece.place_symbol(column, symbol, board)
        expect(board[0][column]).to eq("O")
        expect(board[1][column]).to eq(symbol)
      end

      it 'prints a confirmation of your placement and the state of the board after the placement' do
        column = 2
        row = 1
        board = piece.instance_variable_get(:@board)
        symbol = piece.instance_variable_get(:@player_one_symbol)
        board[0][column] = "O"
        confirmation_message = "You have placed your piece at column ##{column}, row ##{row}"
        expect(piece).to receive(:puts).with(confirmation_message).once
        expect(piece).to receive(:puts).with(board).once
        piece.place_symbol(column, symbol, board)
      end
    end

    context 'when the selected column has no empty spaces' do
      it 'does not change the board state' do
        symbol = piece.instance_variable_get(:@player_one_symbol)
        column = 2
        board = Array.new(6, Array.new(7))
        board[0][column] = "A"
        piece.place_symbol(column, symbol, board)
        expect(board[1][column]).not_to eq(symbol)
        expect(board[5][column]).to eq("A")
      end
      
      it 'prints an error message' do
        symbol = piece.instance_variable_get(:@player_one_symbol)
        column = 2
        board = Array.new(6, Array.new(7))
        board[0][column] = "A"
        error_message = "That column is already full, please select an empty position\n"
        expect(piece).to receive(:puts).with(error_message).once
        piece.place_symbol(column, symbol, board)
      end
    end
  end
end
  



    



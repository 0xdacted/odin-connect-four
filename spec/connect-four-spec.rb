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
        confirmation_message = "You have placed your piece at column ##{column + 1}, row ##{row + 1}"
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
        error_message = "Column ##{column + 1} is already full, please select a column with at least one empty space"
        expect(piece).to receive(:puts).with(error_message).once
        piece.place_symbol(column, symbol, board)
      end
    end
  end

  describe 'winner?' do
    subject(:game_board){described_class.new}
    context 'when a player has four pieces in a vertical row' do
      it 'causes that player to win' do
        board = game_board.instance_variable_get(:@board)
        symbol = game_board.instance_variable_get(:@player_one_symbol)
        name = game_board.instance_variable_get(:@player_one_name)
        winner_message = "Congratulations #{name}, you have won!"
        board[0][0] = symbol && board[1][0] = symbol && board[2][0] = symbol && board[3][0] = symbol
        expect(game_board).to receive(:puts).with(winner_message).once
        game_board.winner?(name, symbol, board)
      end
    end

    context 'when a player has four pieces in a horizontal row' do
      it 'causes that player to win' do
        board = game_board.instance_variable_get(:@board)
        symbol = game_board.instance_variable_get(:@player_two_symbol)
        name = game_board.instance_variable_get(:@player_two_name)
        winner_message = "Congratulations #{name}, you have won!"
        board[0][0] = symbol && board[0][1] = symbol && board[0][2] = symbol && board[0][3] = symbol
        expect(game_board).to receive(:puts).with(winner_message).once
        game_board.winner?(name, symbol, board)
    end
  end

  context 'when a player has four pieces in a diagonal row' do
    it 'causes that player to win' do
      board = game_board.instance_variable_get(:@board)
      symbol = game_board.instance_variable_get(:@player_one_symbol)
      name = game_board.instance_variable_get(:@player_one_name)
      winner_message = "Congratulations #{name}, you have won!"
      board[0][0] = symbol && board[1][1] = symbol && board[2][2] = symbol && board[3][3] = symbol
      expect(game_board).to receive(:puts).with(winner_message).once
      game_board.winner?(name, symbol, board)
    end
   end
  end
end
  



    



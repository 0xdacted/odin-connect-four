require './lib/connect-four.rb'

describe Player do
  describe 'place_piece' do
    subject(:turn) {described_class.new('Johnny, X')}
    context 'when user inputs a valid column with an open space' do
      before do
        valid = 2
        allow(turn).to receive(:gets).and_return(valid)
      end
      it 'outputs messages informing the user that their selection was confirmed and where the piece was placed' do
        name = turn.instance_variable_get(:@name)
        board = [[nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, "X", nil, nil, nil, nil]]
        turn_message = "#{name} it's your turn! Please input your desired column (1-8) and press enter"
        selection_message = "great choice #{name}, you have placed your piece in column 2"
        expect(turn).to receive(:puts).with(turn_message).once
        expect(turn).to receive(:puts).with(selection_message).once
        expect(turn).to receive(:puts).with(board).once
        turn.place_piece
      end

     
    end

    



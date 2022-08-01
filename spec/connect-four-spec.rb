require './lib/connect-four.rb'

describe Player do
  describe 'select_column' do
    subject(:turn) {described_class.new('Johnny, X')}
    context 'when user inputs a valid column' do
      before do
        valid = 2
        allow(turn).to receive(:gets).and_return(valid)
      end
      it 'outputs message informing the user that their selection was confirmed and where the piece was placed' do
        name = turn.instance_variable_get(:@name)
        turn_message = "#{name} it's your turn! Please input your desired column (1-8) and press enter"
        selection_message = "great choice #{name}, you have placed your piece in column 2"
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
        error_message = "Sorry #{name}, you have selected an invalid column, please try again"
        expect(turn).to receive(:puts).with(turn_message).once
        expect(turn).to receive(:puts).with(error_message).once
        turn.select_column
      end
    end

end



    



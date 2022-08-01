class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def select_column
    puts "#{name} it's your turn! Please input your desired column (1-8) and press enter"
    column = gets.to_i
    if column < 9 && column > 0
      puts "great choice #{name}, you have selected column #{column}"
      column -= 1
    else
      puts "that's an invalid choice #{name}, please input a number between 1-8"
        false
    end
    column
  end
end


class ConnectFour
  attr_reader :player_one, :player_two, :player_one_name, :player_one_symbol, :player_two_name, :player_two_symbol
  attr_accessor :board

  def initialize(player_one_name = 'Johnny', player_one_symbol = 'X', player_two_name = 'Bob', player_two_symbol = 'O')
    @player_one_name = player_one_name
    @player_one_symbol = player_one_symbol
    @player_two_name = player_two_name
    @player_two_symbol = player_two_symbol
    @player_one = Player.new(player_one_name, player_one_symbol)
    @player_two = Player.new(player_two_name, player_two_symbol)
    @board = Array.new(6) { Array.new(7) }
  end
end


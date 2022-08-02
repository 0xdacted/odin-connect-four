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
        select_column
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

  def place_symbol(column, symbol, board = @board)
    i = 0
      until i == 6
        if board[i][column].nil?
          @board[i][column] = symbol
          puts "You have placed your piece at column ##{column + 1}, row ##{i + 1}"
          puts @board
          break
        else
          i += 1
          if i == 6
            puts "Column ##{column + 1} is already full, please select a column with at least one empty space"
            return false
          end
        end
      end
    end

    def winner?(name, symbol, board = @board)
      
      board.each_with_index do |row, row_index|
        row.each_with_index do |piece, column_index|
          begin
            if board[row_index][column_index] == symbol && board[row_index + 1][column_index] == symbol && board[row_index + 2][column_index] == symbol && board[row_index + 3][column_index] == symbol ||
              board[row_index][column_index] == symbol && board[row_index][column_index + 1] == symbol && board[row_index][column_index + 2] == symbol && board[row_index][column_index + 3] == symbol ||
              board[row_index][column_index] == symbol && board[row_index + 1][column_index + 1] == symbol && board[row_index + 2][column_index + 2] == symbol && board[row_index + 3][column_index + 3] == symbol
              puts "Congratulations #{name}, you have won!"
              return true
            end
          rescue
          end
        end
      end
  end

  def player_one_turn
    symbol = @player_one_symbol
    name = @player_one_name
    column = @player_one.select_column
    if place_symbol(column, symbol) == false
      player_one_turn
    else
      winner?(name, symbol)
    end
  end

  def player_two_turn
    symbol = @player_two_symbol
    name = @player_two_name
    column = @player_two.select_column
    if place_symbol(column, symbol) == false
      player_two_turn
    else
      winner?(name, symbol)
    end
  end

  def play
    i = 0
    loop do
      if player_one_turn == true
        break
      else
        i += 1
      end

      if i == 42
        puts 'This game has tied, please restart if you would like to play again!'
        break
      end

      if player_two_turn == true
        break
      else
        i += 1
      end

      if i == 42
        puts 'This game has tied, please restart if you would like to play again!'
        break
      end
    end
  end
end

game = ConnectFour.new
game.play



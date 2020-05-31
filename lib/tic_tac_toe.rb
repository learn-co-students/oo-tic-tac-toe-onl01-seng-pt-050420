class TicTacToe

    # attr_accessor :board

    def initialize (board = nil)
        @board = board || Array.new(9, " ")
    end

    TicTacToe::WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]]

    def display_board
        board = @board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def input_to_index(input)
        input = input.to_i - 1
    end

    def move(position, char)
        @board[position] = char
    end
    # # For #move to work, we need to position_taken and valid_move
    def position_taken?(index_i)
        ((@board[index_i] == "X") || (@board[index_i] == "O"))
    end
    # def position_taken?(board, index)
    #     if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
    #        return false 
    #     else
    #        return true
    #     end
    #  end
    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
        turn = 0
        @board.each do |index|
          if index == "X" || index == "O"
            turn += 1
          end
        end
        return turn
    end

    def current_player
            if turn_count % 2 == 0
            "X"
            else
            "O"
            end
    end 
    # #turn 
    def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        char = current_player
        if valid_move?(index)
          move(index, char)
          display_board
        else
          turn
        end
    end

    def won?
        WIN_COMBINATIONS.each {|win_combo|
          index_0 = win_combo[0]
          index_1 = win_combo[1]
          index_2 = win_combo[2]
      
          position_1 = @board[index_0]
          position_2 = @board[index_1]
          position_3 = @board[index_2]
      
          if position_1 == "X" && position_2 == "X" && position_3 == "X"
            return win_combo
          elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
            return win_combo
          end
        }
        return false
    end

    def full?
        @board.all? {|index| index == "X" || index == "O"}
    end

    def draw?
        if !won? && full?
          return true
        else
          return false
        end
    end

    def over?
        if won? || draw?
          return true
        else
          return false
        end
    end

    def winner
        index = []
        index = won?
        if index == false
          return nil
        else
          if @board[index[0]] == "X"
            return "X"
          else
            return "O"
          end
        end
    end

    def play
        turn until over?
        if won? 
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end

end  






        # WIN_COMBINATIONS.each {|win_combo|
        #   index_0 = win_combo[0]
        #   index_1 = win_combo[1]
        #   index_2 = win_combo[2]
      
        #   position_1 = @board[index_0]
        #   position_2 = @board[index_1]
        #   position_3 = @board[index_2]
      
        #   if position_1 == "X" && position_2 == "X" && position_3 == "X"
        #     return win_combo
        #   elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        #     return win_combo
        #   end
        # }
        # return false
      
    
    # #full?
    # def full?
    #   @board.all?{|occupied| occupied != " "}
    # end
    
    # #draw
    # def draw?
    #   !(won?) && (full?)
    # end
    
    # #over?
    # def over?
    #   won? || full? || draw?
    # end
    
    # #winner?
    # def winner
    #   WIN_COMBINATIONS.detect do |win_combo|
    #     if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
    #       return "X"
    #     elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
    #       return "O"
    #     else
    #       nil
    #     end
    #   end
    # end
    
    # #play
    # def play
    #   while over? == false
    #     turn
    #   end
    #   if won?
    #     puts "Congratulations #{winner}!"
    #   elsif draw?
    #     puts "Cat's Game!"
    #   end
    # end
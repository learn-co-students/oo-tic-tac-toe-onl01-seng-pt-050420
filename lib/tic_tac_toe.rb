require 'pry'
class TicTacToe
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def initialize(board=nil)
        @board = Array.new(9, " ")
    end
    def display_board
        
            puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
            puts "-----------"
            puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
            puts "-----------"
            puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
         
    end
    def input_to_index(input)
        index = input.to_i - 1
       
     end

     def move (index, token = "X")
        @board[index] = token
     end
     def position_taken?(index)
        !(@board[index] == " ")
     end
     def valid_move?(index)
        #index.between(0,8) && @board[index] == " "
     
        if (0..8).include?(index)
            if @board[index] == " "
              return true
            else
              return false
            end
          else
            return false
          end
        end
        def turn_count
            count = 0
            9 - @board.count(" ")
        
        end
        def current_player
            if turn_count.even?
                "X"
            else
                "O"
            end
        end

        def turn 
          puts " Please enter a move : 1-9"
          input = gets.chomp
          index = input_to_index(input)
        
            if valid_move?(index) == true
                token = current_player
                move(index, token)
                display_board
            else
                turn
             end
                  
        end
        def won?
            WIN_COMBINATIONS.map do |combos|
                count = 0
                initial_index = combos[0]
                combos.each do |combo|
                if @board[combo] == @board[initial_index]
                count += 1 unless @board[initial_index] == " "
                end
            end
            return combos if count == 3
          end
      false
    end
    def full?
        @board.all? do |spaces| 
            if spaces == " " || won? != false
                false
           else
                true
            end
        end
    end

    def draw?

        @board.all? do |spaces| 
            if spaces == " " || won? != false
                false
           else
                true
            end

        end
    end
    def over?
        
        if won? != false || draw? == true
            return true
        else
            return false
        end
        
    end
    def winner
        
        if won? == false
          return nil
        else
          winning_token = won?[0]
          
          @board[winning_token]
          
        end
    
    end
    def play 
        until over?
            turn
          end
          if won?
            winner_of_game = winner
            puts "Congratulations #{winner_of_game}!"
          elsif draw?
            puts "Cat's Game!"
          end
   
    end
   
end


# new_game = TicTacToe.new
# new_game.play

    
        
        
        
        
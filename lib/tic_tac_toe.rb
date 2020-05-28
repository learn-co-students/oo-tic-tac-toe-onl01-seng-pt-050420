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
          players_input = input_to_index(input)
          token = current_player
            if valid_move?(input) == true
                move(players_input, token)
                display_board
            else
                turn
            # puts "Try again" 
            # valid_move?(input)
            # move(players_input, token)
            # display_board

         end
         
            
        end


        end


    
        
        
        
        
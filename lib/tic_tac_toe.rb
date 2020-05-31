class TicTacToe
    def initialize(board = nil)
        @board = Array.new(9," ")
    end
    WIN_COMBINATIONS = [ # Nested array of winning options.
        [0,1,2], [3,4,5], [6,7,8],
        [0,3,6], [1,4,7], [2,5,8],
        [0,4,8], [6,4,2] ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(number) # number would come form the user as 1-9
        number.to_i - 1 # Array counts 0-8, so 1 needs to be taken away
    end

    def move(index, token = X) # Takes in the number and choosen token. Defalut token is X.
        @board[index] = token   # Places the number inside the @board index and places the token in that spot. 
    end

    def position_taken?(index)
        @board[index] != " " ? true : false 
    end
    
    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        turn_count.odd? ? "O" : "X"
    end
    
    def turn
        puts "Pick a number (1-9):"
        number = gets.chomp
        index = input_to_index(number)
        if valid_move?(index)
            token = current_player
            move(index, token)
        else
            turn
        end
        display_board
    end
    
    def won?
        WIN_COMBINATIONS.any? do |combo|
            if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
                return combo
              end
        end
    end

    def full?
        @board.all? { |space| space != " "}
    end

    def draw?
        !won? && full?
    end

    def over?
        draw? || won?
      end
    
      def winner
        if combo = won?
          @board[combo[0]]
        end
      end
    
      def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
      end
end
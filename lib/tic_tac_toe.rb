class TicTacToe
    def initialize(board = nil)
        @board = board || Array.new(9," ")
    
    end

WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [0,4,8],
    [1,4,7],
    [2,4,6],
    [2,5,8]
]

def display_board
board = [9," "]
game = self.class.new
game.instance_variable_set(:@board, board)

puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts "-----------"
puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts "-----------"
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "



end

    def input_to_index(input)
        input.to_i - 1


    end

    def move(index, token)
        @board[index] = token
        # token = "x" || "o"
    end

    def position_taken?(index)
        @board[index] != " "

    end

    def valid_move?(index)
        
        !position_taken?(index) && index.between?(0,8)
    
    end

    def turn_count
        
        @board.count {|spot| spot != " "}
    
    end

    def current_player
    
        turn_count.even? ? "X" : "O"
    
    end

    def turn 
        
        puts "Please enter a number (1-9)"
        
        entered_number = gets.strip
        index = input_to_index(entered_number)
        if valid_move?(index)
            token = current_player
            move(index, token)
        else
            turn
        end
        display_board
    
    end

    def won?
        WIN_COMBINATIONS.map do |combo|
            count = 0
            index = combo[0]
            combo.each do |combo|
                if @board[combo] == @board[index]
                    count += 1 unless @board[index] == " "
                end
            end
            return combo if count == 3
        end
        false
    end


        def full?
            @board.all? {|spot| spot != " "} 
        
        end

        def draw?
            full? && !won?
        
        end

        def over?
        won? || draw?
        
        end

        def winner
            WIN_COMBINATIONS.detect do |win_combo|
              if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
                return "X"
              elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
                return "O"
              else
                nil
              end
            end
          end


def play 
    while over? == false
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end


end



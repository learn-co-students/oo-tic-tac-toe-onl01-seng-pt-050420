require 'pry'

class TicTacToe
    attr_reader :board

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]]

    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    end

    def display_board()
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"       
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def input_to_index(pos)
        pos.to_i - 1
    end

    def move(index, token)
        board[0] = "X"
        board[4] = "O"
    end

    def position_taken?(pos)
        board[pos].include?("X") || board[pos].include?("O")
    end 

    def valid_move?(index)
        index >= 0 && index <= 8 && !position_taken?(index)
    end

    def turn
        puts 'Player #{current_player}" Please enter your move:'
        index = input_to_index(gets.chomp)
        if valid_move?(index)
            board[index] = current_player
            display_board
        else 
            while !valid_move?(index)
                index = input_to_index(gets.chomp)
                puts "Invalid move, please enter a valid move:"
                valid_move?(index)
            end
            display_board
        end
    end

    def turn_count
        board.select{|token| token == "X" || token == "O"}.size
    end 

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def won?
        WIN_COMBINATIONS.detect do |combo| 
            board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]] &&
            (board[combo[0]] == "X" || board[combo[0]] == "O")
        end
    end

    def full?
        board.all? {|token| token == "X" || token == "O"}
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        if won?
            board[won?[0]]
        else
            nil
        end
    end

    def play
        while !over?
            turn
        end
        if won? 
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end

end

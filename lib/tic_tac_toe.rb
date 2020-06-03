class TicTacToe
    attr_reader :board
    
    WIN_COMBIONATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
      ]
        
    def initialize
      @input = ""
      @board = Array.new(9," ")
      
    end
    
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    
    
    def input_to_index(input)
      @input = input.to_i - 1
    end
    
    def move(board_index, token = "X")
      
      @board[board_index] = token
      
    end
    
    def position_taken?(board_index)
      @board[board_index] != " "
      
    end
    
    
    def valid_move?(board_index)
      !position_taken?(board_index) && board_index.between?(0,8)
    end
    
    
    def turn_count
      total_x = @board.count{|letter| letter == "X"}
      total_o = @board.count{|letter| letter == "O"}
      return total_x + total_o 
    end
    
    def current_player
      x = turn_count
      if x % 2 == 0 
        return "X"
      else
        return "O"
      end
      
    end
    
    def turn 
      
      puts "Please enter a number 1-9"
      raw_input = gets.chomp 
      
      input = input_to_index(raw_input)
      # fix the valid_move method
      if valid_move?(input)
        token = current_player
        move(input, token)
        display_board
      else
        display_board
        turn
      end
    end
    
    
    def won? 
      #fix the win condition constant
      WIN_COMBIONATIONS.any? do |combo|
        if position_taken?(combo[0]) &&
            @board[combo[0]] == @board[combo[1]] && 
            @board[combo[1]] == @board[combo[2]]
            return combo
        end
    end


    end
    
    def full?
      if turn_count == 9 
        true 
      else
        false 
      end
    end
    
    def draw?
      if full? == true && won? == false
        true
      elsif full? == false && won? == false 
        false
      end
    end
    
    
    def over? 
      if full? == true || won? == true
        true
      end
    end
    
    def winner
      # fix win condition to get winner
      return nil unless self.won?
      @board[self.won?[0]]
    end
    
    
    
    
    
    
    
    
  
  
  
  
  
  end
require 'pry'

class TicTacToe
  def initialize
    @board = Array.new(9," ")
  end

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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O" ? true : false
  end

  def valid_move?(index)
    index.between?(0,8) && !(position_taken?(index))
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    
    if valid_move?(index) 
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  # def won?
  #   #binding.pry

  #   if (@board[0] == @board[1] && @board[1] == @board[2] && position_taken?(0))
  #     return WIN_COMBINATIONS[0]
  #   elsif (@board[3] == @board[4] && @board[4] == @board[5] && position_taken?(3))
  #     return WIN_COMBINATIONS[1]
  #   elsif (@board[6] == @board[7] && @board[7] == @board[8] && position_taken?(6))
  #     return WIN_COMBINATIONS[2]
  #   elsif (@board[0] == @board[3] && @board[3] == @board[6] && position_taken?(0))
  #     return WIN_COMBINATIONS[3]
  #   elsif (@board[1] == @board[4] && @board[4] == @board[7] && position_taken?(1))
  #     return WIN_COMBINATIONS[4]
  #   elsif (@board[2] == @board[5] && @board[5] == @board[8] && position_taken?(2))
  #     return WIN_COMBINATIONS[5]
  #   elsif (@board[0] == @board[4] && @board[4] == @board[8] && position_taken?(0))
  #     return WIN_COMBINATIONS[6]
  #   elsif (@board[2] == @board[2] && @board[4] == @board[6] && position_taken?(2))
  #     return WIN_COMBINATIONS[7]
  #   end
  # end

  def won? 
    WIN_COMBINATIONS.any? do |combo| 
      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] 
        return combo 
      end 
    end 
  end

  def full?
    @board.all?{|element| element == "X" || element == "O"}
  end

  def draw?
    full? && !(won?)
  end
  
  def over?
    won? || draw?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    # until the game is over
    # if !(over? || draw?)
    #   turn
    #   if !(draw?)
    #     turn
    #   end
    # end
    
    turn until over?
    
    # if the game was won
    if winner
      #index = won?
      #winner = @board[index[0]]
      puts "Congratulations #{winner}!"
    elsif
      puts "Cat's Game!"
    end
  end

end
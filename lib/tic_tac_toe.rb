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
    index < 0 || index > 8 || position_taken?(index) ? false : true
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.chomp
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
 
  def won?
    winning_combo = nil

    if (@board[0] == @board[1] && @board[1] == @board[2])
      winning_combo = WIN_COMBINATIONS[0]
    elsif (@board[3] == @board[4] && @board[4] == @board[5])
      winning_combo = WIN_COMBINATIONS[1]
    elsif (@board[6] == @board[7] && @board[7] == @board[8])
      winning_combo = WIN_COMBINATIONS[2]
    elsif (@board[0] == @board[3] && @board[3] == @board[6])
      winning_combo = WIN_COMBINATIONS[3]
    elsif (@board[1] == @board[4] && @board[4] == @board[7])
      winning_combo = WIN_COMBINATIONS[4]
    elsif (@board[2] == @board[5] && @board[5] == @board[8])
      winning_combo = WIN_COMBINATIONS[5]
    elsif (@board[0] == @board[4] && @board[4] == @board[8])
      winning_combo = WIN_COMBINATIONS[6]
    elsif (@board[2] == @board[1] && @board[4] == @board[6])
      winning_combo = WIN_COMBINATIONS[7]
    end

    winning_combo
  end

  def full?
    @board.all?{|element| element == "X" || element == "O"}
  end

  def draw?
    if (full? && !(won?))
      true
    else 
      false
    end
  end
  
  def over?
    won? || draw?
  end

  def winner
    player_winner = nil
    index = []
    index = won? 
    if index == false
      player_winner = nil
    else
      #player_winner = @board[index[0]]
      if @board[index[0]] == "X"
        player_winner = "X"
      else
        player_winner = "O"
      end
    end
    player_winner
  end

  def play
    # until the game is over
    if !(over?)
      turn
      if !(draw?)
        play
      end
    end
    
    # if the game was won
    if won?
      puts "Congratulations #{winner}!"
    elsif
      puts "Cat's Game!"
    end
  end

end
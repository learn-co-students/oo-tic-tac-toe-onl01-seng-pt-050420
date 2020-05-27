require 'pry'

class TicTacToe
  
  WIN_COMBINATIONS=[
    [0,1,2], [3,4,5], [6,7,8], [0,3,6], [0,4,8], [1,4,7], [2,4,6], [2,5,8]
    ]
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(num)
    integer = num.to_i
    integer - 1
  end
  
  def move(index, token="X")
    @board[index] = token
  end
  
  def position_taken?(position)
    if @board[position] == " "
      false
    else 
      true
    end
  end
  
  def valid_move?(position)
    if position >= 0 && position <= 8 && @board[position] == " "
      true 
    else 
      false
    end
  end
  
  def turn_count
    @board.count {|x| x != " "}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    index = input_to_index(gets)
    if valid_move?(index)
     move(index, current_player)
     display_board
    else
      turn
    end
  end
  
  def won?
    winning_move = WIN_COMBINATIONS.detect { |combo|
      combo.all?{ |position| @board[position] == "X" } || combo.all?{ |position| @board[position] == "O" }
    }
    if winning_move != nil
      winning_move
    else
      false
    end
  end
  
  def full?
    @board.all? {|x| x != " "}
  end
  
  def draw?
    if full? && !won?
      true
    else 
      false
    end
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    if won?
      @board[won?[0]]
    end
  end
  
  def play 
    turn until over?
    if draw?
      puts "Cat's Game!"
    else 
      puts "Congratulations #{winner}!" 
    end
  end
end


class TicTacToe
  WIN_COMBINATIONS = [  #CORRECT
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # left Col 
  [1,4,7], # Middle col 
  [2,5,8], # Right col
  [0,4,8], # Diag left 
  [2,4,6] # Diag right
  ]
  def initialize(board=nil)
     @board = board || board = Array.new(9, " ")
  end
  def display_board                                              #CORRECT
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(u_inp)
    u_inp.to_i - 1 #=> 4-1=3
  end
  def move(index, token= "X")
    @board[index] = token
  end
  def position_taken?(index)
    @board[index] != " "
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  def turn_count
    @board.count{|token|token != " "}
  end
  def current_player
    turn_count.even? ? "X" : "O"
  end
  def turn 
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    valid_move?(index) ? move(index, current_player) : turn 
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
    @board.all? {|space| space == "X" || space == "O"}
  end
  def draw?
    full? && !won?
  end
  def over?
    won? || draw?
  end
  def winner
    if combo = won?
      @board[combo[0]]
    end
  end
  def play 
    turn until over?
    
    if winner
      puts "Congratulations #{winner}!"
    else 
      puts "Cat's Game!"
    end
  end
end

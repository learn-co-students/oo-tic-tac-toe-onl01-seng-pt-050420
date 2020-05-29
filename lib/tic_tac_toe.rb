class TicTacToe
  
  WIN_COMBINATIONS = [[0,1,2],
      [3,4,5],
      [6,7,8],
      [0,4,8],
      [2,4,6],
      [0,3,6],
      [1,4,7],
      [2,5,8]]
  
  def initialize(board = nil)
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
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == " "
      false
    else
      true
    end
  end
  
  def valid_move?(index)
    if (0..8).include?(index)
      if @board[index] == " "
       true
      else
        false
      end
    else
      false
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
    puts "Please choose a number 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      player_token = current_player
      move(index, player_token)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.find {|combo| 
    combo.all? {|i| @board [i]=="X"} ||
    combo.all? {|i| @board [i]=="O" } 
    }
  end 
  
  def full?
    @board.all?{|square| square != " " }
  end 
  
   def draw?
    full? && !won?
  end
  
   def over?
    won? || draw?
  end

  def winner
    if combo =  won?
      @board[combo[0]]
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
    
    new_game = TicTacToe.new
    new_game.play
    
end

class TicTacToe 
  #WIN_COMBINATIONS takes in the TTT win combinations as sets of array inside an array
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]
  
  
  def initialize(board = nil) #don't need to pass in the board = nil as an argument 
    @board = board || Array.new(9, " ")
  end 
  
  # Interpolation #{} is used here to include whatever interger that is input by the user when they takes turn
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

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(index_i)
    !(@board[index_i] == " ")
    
    #The code below also works: 
    #((@board[index_i] == "X") ||(@board[index_i] == "O"))
    
    #Or this code: 
    #if @board[index_i] == " "
      #false 
    #else 
      #true 
    #end 
    
    #prefer: 
    #@board[index_i] != " "
  end
  
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    puts "Please choose a number 1-9:"
    user_input = gets.strip   # can also use gets.chomp here
    index = input_to_index(user_input)
    if valid_move?(index)
      player_token = current_player
      move(index, player_token)
      display_board
    else
      turn
    end
  end 
  
  def turn_count  
   @board.count{|character| character == "X" || character == "O"} 
  end 
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
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
  
  #def full? 
    #@board.all? {|character| character == "X" || character == "O"} 
  #end 
  
  #def draw?
    #full? && !won? 
  #end 
  
  #def over?
    #draw? || won?
  #end 
  
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

  
end 
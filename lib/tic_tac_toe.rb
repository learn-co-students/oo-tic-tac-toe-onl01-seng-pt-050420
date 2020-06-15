class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ") #new board setup 
  end 
  
  WIN_COMBINATIONS = [ #Array with all possible combinations
    [0,1,2], #Top Row 
    [3,4,5], #Middle Row 
    [6,7,8], #Bottom Row 
    [0,3,6], #Left Column
    [1,4,7], #Middle Column
    [2,5,8], #Right Column
    [0,4,8], #Diagonal Left-to-right
    [2,4,6]  #Diagonal Right-to-left
  ]
  
  def display_board   #Displays the TicTacToe game board 
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
   def current_player #Alternate between players
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count 
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def input_to_index(input) #Change input from user to match board 
    input.to_i - 1
  end 
  
   def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index) #Checks to see if slot is occupied
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index) 
    index.between?(0,8) && !position_taken?(index)
  end
  
 def turn #Takes users input as string,changes to int, checks to see if move valid, proceeds to next turn after validation 
    puts "Please enter a number 1-9: "
    input = gets.strip
    index = input_to_index(input)
    cp = current_player
    if valid_move?(index)
      move(index, cp)
      display_board
    else
      turn
    end
  end
  
   def won? #Double checks if the combo inputted has won
    a = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
    }
    b = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
    }
    return a || b
  end

  def full? #Checks whole board to determine if full
    !@board.any?{|x| x == "" || x == " "}
  end
  
   def draw? #Checks methods won for false & full for true, then game is a draw
    !won? && full?
  end
  
  def over? #If the game is won or a draw, game is now over
    won? || draw?
  end
  
  def winner 
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
  end
  
  def play #Checks if game is over, if false, next turn; if won, congrats;
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
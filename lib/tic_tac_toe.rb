class TicTacToe
  
  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2],
    ]
   
    
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(index)
    return index.to_i - 1
  end
  
  def move(index,token = "X") 
    @board[index] = token
  end
  
  def position_taken?(index)
    
    if( @board[index] == "X" || @board[index] == "O" )
      return true
    else 
      return false
    end
  end
  
  def valid_move?(index)
    if(index.between?(0,8) && !position_taken?(index))
      	return true
    end
  end
  
   def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

   def won?
     WIN_COMBINATIONS.each do |win|
       index1 = win[0]
       index2 = win[1]
       index3 = win[2]
       
       position1 = @board[index1]
       position2 = @board[index2]
       position3 = @board[index3]
       
      if position1 == "X"  && position2 == "X" && position3 == "X"
         return win
      elsif position1 == "O" && position2 == "O" && position3 == "O"
         return win
      end
    end
    return false
    end

  def full?
    @board.each do |ele|
      if ele != "X" && ele != "O"
        return false
      end
    end
    return true
  end
  

  def draw?
  if  full? && !won?
    return true
  else 
    return false
  end
end

  
  def winner 
    if(won?)
      return @board[won?[0]]
    end
  end
  
  def over?
    if(won? || draw?)
      return true
    else
      return false
    end
    
  end
  
  def turn 
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end
  
  def play 
   until over?
    turn
  end
  
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
   puts "Cat's Game!"
 end
 
  
    
    
end

end
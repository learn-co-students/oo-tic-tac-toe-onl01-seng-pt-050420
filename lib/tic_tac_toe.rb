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
  [2,4,6]
]
  
  def initialize
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
      input.to_i - 1
    end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def  position_taken?(index)
    @board[index] != " "
  end
  
  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
end

  def turn_count
      counter = 0
      @board.each do |pos|
        if pos == "X" || pos == "O"
          counter += 1
        end
       end 
      counter
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Where would you like to move (1-9)"
    input = gets.strip
    index = input_to_index(input)
    if self.valid_move?(index)
      self.move(index, self.current_player)
      self.display_board
    else
      puts "Sorry, not a valid move"
      self.turn
    end
  end

def won?
  WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return win_combo
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      return win_combo
    end
      false
  end
end

def full?
  self.turn_count == 9
 end
 
 def draw?
   self.full? && !self.won?
 end
 
 def over?
   self.draw? || self.won?
 end
   
def winner
  self.won? ? @board[self.won?[0]] : nil
end
  
 def play
   while !over?
   turn
  end
  puts "Congratulations #{self.winner}!" if self.won?
  puts "Cat's Game!" if self.draw?
end

 
end


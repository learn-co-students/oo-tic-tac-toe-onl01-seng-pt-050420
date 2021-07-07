class TicTacToe
  
  attr_reader :board
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    
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
  
  def position_taken?(index)
    
    @board[index] != " "
    
  end
  
  def valid_move?(index)
    
    !position_taken?(index) && index.between?(0, 8)
    
  end
  
  def turn_count
    
    @board.count {|pos| pos == "X" || pos == "O"}
    
  end
  
  def current_player
    
    self.turn_count % 2 == 0 ? "X" : "O"
    
  end
  
  def turn
    
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      self.move(index, self.current_player)
      self.display_board
    else
      puts "Not a valid move!"
      self.turn
    end
  end
  
  def won?
    
    WIN_COMBINATIONS.any? do |combo|
      
      if position_taken?(combo[0]) && 
        @board[combo[0]] == @board[combo[1]] && 
        @board[combo[1]] == @board[combo[2]]
        return combo
      end
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
    
    # self.won? ? "Congratulations #{self.winner}!" : "Cat's Game!"
    puts "Congratulations #{self.winner}!" if self.won?
    puts "Cat's Game!" if self.draw?
    
  end
  
  
  
end
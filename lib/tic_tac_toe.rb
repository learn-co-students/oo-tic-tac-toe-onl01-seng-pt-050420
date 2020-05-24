require 'pry'

class TicTacToe
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  
  attr_accessor :board
  
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(num_str)
    num_str.to_i-1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] == " " ? false : true
  end
  
  def valid_move?(index)
    @board[index] == " " ? true : false
  end
  
  def turn_count
    @board.select{|token| token != " "}.count
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    position = nil
    until (1..9).include? position
      puts "Enter a number 1-9"
      position = gets.chomp.to_i
    end
    index = self.input_to_index(position)
    self.valid_move?(index)
    current_player = self.current_player
    self.move(index, current_player)
    self.display_board
  end
  
  def won?
    winner = false
    win_combo = []
    WIN_COMBINATIONS.each do |combo|
      win_combo = combo
      combo_arr = []
      combo.each do |index|
        combo_arr.push(@board[index])
        if combo_arr.length == 3 && combo_arr.all? {|token| token == "X"}
          return win_combo
        elsif combo_arr.length == 3 && combo_arr.all? {|token| token == "O"}
          return win_combo
        end #if statement
      end #combos.each
    end #WIN_COMBINATIONS.each
    winner
  end #won
  
  def full?
    if @board.include?("_")
      false
    else
      self.draw?
    end
  end
  
  def draw?
    if @board.include?(" ")
      false
    else
      !self.won?
    end
  end
  
  def over?
    true if self.draw? || self.won?
  end
  
  def winner
    if self.won? == false
      nil
    else
      winner_token = self.won?[0]
      @board[winner_token]
    end
  end
  
  def play
    TicTacToe.new
    until self.over? == true
      puts turn_count
      self.turn
    end
    if self.draw? == true 
      puts "Cat's Game!"
    else
      puts "Congratulations #{self.winner}!"
    end
  end
end
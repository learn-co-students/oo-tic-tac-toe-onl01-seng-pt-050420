require 'pry'

class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

   def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_selection)
    user_input_to_integer = user_selection.to_i
    user_input_to_integer-1
  end

  def move(index, player_token = "X")
    @board[index] = player_token
  end

  def position_taken?(index)
    if @board[index] != " "
      return true
    else
      return false
    end
  end

  def valid_move?(index)
    if (0..8).include?(index)
      if @board[index] == " "
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def turn_count
    count = 0
    @board.each do |space|
      if space != " "
        count += 1
      end
    end
    count
  end

  def current_player
    odd_or_even = turn_count
    if odd_or_even.odd?
      return "O"
    else
      return "X"
    end
  end

  def turn
    puts "Choose a place on the board between 1 and 9"
    user_choice = gets.chomp
    user_index = input_to_index(user_choice)
    valid_user_choice = valid_move?(user_index)
    x_or_o = current_player
    if valid_user_choice == true
      move(user_index, x_or_o)
      display_board
    else
      "Please choose again."
      user_choice =  gets
    end
  end

  def won?
       WIN_COMBINATIONS.each do |combo|
       count = 0
       initial_index = combo[0]
       combo.each do |position|
         if @board[position] == @board[initial_index]
           count += 1 unless @board[initial_index] == " "
         end
       end
       return combo if count == 3
     end
     return false
   end

   def full?
       @board.each do |position|
           if position == " "
               return false
           end
       end
       not_won = won?
       return true
   end

   def draw?
       @board.each do |position|
           won_or_not_won = won?
           if position == " " || won_or_not_won != false
           return false
           end
       end
       return true
   end

   def over?
       is_won = won?
       is_a_draw = draw?
       if is_won != false || is_a_draw == true
           return true
       else
           return false
       end
   end

   def winner
       winner_is_combo = won?
       if winner_is_combo == false
         return nil
       else
         winning_token = winner_is_combo[0]
         @board[winning_token]
       end
     end

end

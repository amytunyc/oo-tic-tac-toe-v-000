class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
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
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
    
  def input_to_index(user_input)
    user_input.to_i-1
  end
  
  def move(location, player = "X")
    @board[location] = player
  end
  
  def position_taken?(position)
    if @board[position] == "X" || @board[position] == "O"
      true 
    else
      false 
    end
  end
  
  def valid_move?(index)
    if !position_taken?(index) && index.between?(0,8)
      true 
    else
      false 
    end
  end
  
  def turn 
    puts "Please enter 1-9:"
    input=gets.chomp
    index=input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0 
    @board.each do |token|
      if token == "X" || token =="O"
        counter+=1 
      end
    end
    counter
  end
  
  def current_player
    turn_count.even?? "X" :"O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
     if (@board[combo[0]]) == "X" && (@board[combo[1]]) == "X" && (@board[combo[2]]) == "X" || (@board[combo[0]]) == "O" && (@board[combo[1]]) == "O" && (@board[combo[2]]) == "O"
      return  combo
      end
    end
      false
  end
  
  def full?
    @board.all? do |token|
      token=="X" || token=="O"
    end
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    full? || won? ||draw?
  end
  
  def winner
    WIN_COMBINATIONS.detect do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" 
        return "X"
      elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        return "O"
      else
        nil
      end
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
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
    if valid_move?(input)
      move(input, player)
    else
      turn
    end
    display_board
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
    WIN_COMBINATIONS.each do |win_combo|
       index_1 = win_combo[0]
      index_2 = win_combo[1]
      index_3 = win_combo[2]
    
      position_1 = board[index_1]
      position_2 = board[index_2]
      position_3 = board[index_3]
    
      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 =="O"
        return win_combo
        end
      end
    else
      false
  end
end
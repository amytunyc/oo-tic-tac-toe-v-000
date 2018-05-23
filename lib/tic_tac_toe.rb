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
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      false  
    else
      true
    end
  end
  
  def valid_move?(index)
    if !position_taken?(index) && index.between?(0,8)
      true 
    else
      false 
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
    
end
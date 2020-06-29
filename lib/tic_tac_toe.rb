class TicTacToe
  WIN_COMBINATIONS =[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]
  
  attr_reader :board
  
  def initialize
    @board = []
    i=0
    while i < 9
      @board[i] = ""
      i += 1
  end
  @board = Array.new(9," ")
  @board = [" "," "," "," "," "," "," "," "," "]
 end   
 
 def display_board
    puts (" #{board[0]} | #{board[1]} | #{board[2]} ")
    puts ("-----------")
    puts (" #{board[3]} | #{board[4]} | #{board[5]} ")
    puts ("-----------")
    puts (" #{board[6]} | #{board[7]} | #{board[8]} ")
  end
  
  def input_to_index(input)
    @index = input.to_i - 1
  end
  
  def move(index, token)
    board[index] = token
  end
  
  def position_taken?(index)
    board[index] == "X" || board[index] == "O"
  end
  
  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end
  
  def turn_count
    board.count do |space|
      space == "X" || space == "O"
    end
  end
  
  def current_player
    turn_count.even? ? "X" : "O"
  end
  
  def turn
    puts " Please make a move by entering a number 1-9"
    input = gets.strip
    input = input_to_index(input)
    if valid_move?(index)
     move(index,current_player)
     display_board
    else
      turn
    end
      index = -1
        until valid_move?(index)
         puts "Please make a move"
         input = gets.strip
         index = input_to_index(input)
         if valid_move?(index)
          move(index,current_player)
          display_board
       end
    end
  end 
end




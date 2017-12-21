WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [2,5,8],
  [1,4,7]
]

def display_board(board)
 puts " #{board[0]} | #{board[1]} | #{board[2]} "
 puts "-----------"
 puts " #{board[3]} | #{board[4]} | #{board [5]} "
 puts "-----------"
 puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, index)
 if board[index] == "" || board[index] == " " || board[index] == nil
   false
 else
   true
end
end

def valid_move?(board, index)
 board.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  valid = valid_move?(board, index)
  if valid == true
    move(board, index, "X")
    display_board(board)
else
  puts "Please enter 1-9:"
  input = gets.strip
end
end

def turn_count(board)
counter = 0
board.each do |turn|
  if turn == "X" || turn == "O"
    counter += 1
  end
end
return counter
end

def current_player(board)
   turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    index0 = win_combination[0]
    index1 = win_combination[1]
    index2 = win_combination[2]

     if board[index0] == "X" && board[index1] == "X" && board[index2] == "X"
   return win_combination
 elsif board[index0] == "O" && board[index1] == "O" && board[index2] == "O"
   return win_combination
 end
 end
   return nil
end

def full?(board)
board.none?{|index| index == "" || index == " " || index == nil}
end

def draw?(board)
!won?(board) && full?(board)
end

def over?(board)
  if (won?(board) || full?(board) || draw?(board))
  return true
else
  false
end
end

def winner(board)
  if !won?(board)
    return nil
  end
  board[won?(board)[0]]
end

def play
  until over?(board)
    turn
  end
  if draw?
    puts "Cat's Game!"
  end
  if won?
    puts "Congratulations" + winner + "!"
  end
end

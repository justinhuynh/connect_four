require 'pry'

class Board
  attr_reader :columns, :rows, :last_column, :last_row
  attr_accessor :board

  def initialize(columns = 10, rows = 10)
    @columns = columns
    @rows = rows
    @board = []
    @last_column = nil
    @last_row = nil

    @columns.times do
      column = []
      @rows.times { |row| column << nil }
      @board << column
    end
  end

  def place(column, piece)
    row = board[column].compact.count
    error_message = "Column #{column} is full - try another column"
    return error_message if row == rows

    # row is the number of pieces currently on the board, as well as the next "open" slot, since array is zero-indexed
    board[column][row] = piece

    @last_column = column
    @last_row = row
    return "#{piece.to_s} wins!" if check_for_win
    "#{piece.to_s} placed at Col: #{last_column}, Row: #{last_row}"
  end

  def check_for_win
    current_piece = board[last_column][last_row]
    DIRECTIONS.keys.each do |direction|
      max_consecutive = send direction, last_column, last_row, current_piece, 1
      return true if max_consecutive > 3
    end
  end

  def show_board
    board.transpose.reverse
  end

  # you only need to check the current piece
  # row 0 is at the bottom of the board
  # row 10 is at the top of the board

  # offset by direction as [column_offset, row_offset]

  DIRECTIONS = {
    top: [0, 1],
    left: [-1, 0],
    right: [1, 0],
    bottom: [0, -1],
    top_left: [-1, 1],
    top_right: [1, 1],
    bottom_left: [-1, -1],
    bottom_right: [1, -1]
  }

  # if the current column is 0, skip left
  # if the current column is @columns, skip right
  # if the current row is 0, skip bottom
  # if the current row is @rows, skip top

  # consider refactoring column, row and current_piece to Cell

  DIRECTIONS.each do |direction, offsets|
    column_offset = offsets.first
    row_offset = offsets.last

    define_method direction do |column, row, current_piece, current_count|
      offset_column = column + column_offset
      offset_row = row + row_offset

      if board[offset_column][offset_row] == current_piece && adjacent_exists?(offset_column, offset_row)
        current_count += 1
        send direction, offset_column, offset_row, current_piece, current_count
      else
        current_count
      end
    end
  end

  def adjacent_exists?(offset_column, offset_row)
    offset_column.between?(0, @columns - 1) &&
    offset_row.between?(0, @rows - 1)
  end
end


b = Board.new
b.place(3, :red)
b.place(3, :red)
b.place(3, :red)

b.place(4, :black)
b.place(4, :red)

b.place(5, :black)
b.place(5, :black)
b.place(5, :red)

b.place(6, :black)
b.place(6, :black)
b.place(6, :black)


# b.place(3, :red)

binding.pry

class Game
  attr_reader :board, :board_new

  def initialize(board)
    @board = board
    @board_new = board.clone
    @board_size = board.size

  end

  def tick
    @board.each_with_index do |row, r|
      row.each_with_index do |cell, c|
        @board_new[r, c] = new_status r, c
      end
    end
    #@board = @board_new
    #@board_new = @board_new.clone
  end

  private

  def new_status(r, c)
    neighbour_count = get_neighbour_count r, c
    if neighbour_count < 2
      return false
    elsif neighbour_count < 4 && @board[r, c]
      return true
    elsif neighbour_count > 3
      return false
    elsif neighbour_count == 3
      return true
    end
  end

  def get_neighbour_count(r, c)
    count = 0
    if r == 0
      left = r
    else
      left = r - 1
    end
    if r == @board_size - 1
      right = @board_size - 1
    else
      right = r + 1
    end
    if c == 0
      above = c
    else
      above = c - 1
    end
    if c == @board_size - 1
      below = @board_size - 1
    else
      below = c + 1
    end
    (left..right).each do |row|
      (above..below).each do |column|
        unless r == row && c == column
          if @board[row, column]
            count += 1
          end
        end
      end
    end
    count
  end
end
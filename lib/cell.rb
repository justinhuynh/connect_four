class Cell
  attr_reader :column, :row, :owner

  def initialize(column, row)
    @column = column
    @row = row
    @owner = nil
  end

  def set_owner(owner)
    @owner ||= owner
  end

  def empty?
    @owner.nil?
  end
end

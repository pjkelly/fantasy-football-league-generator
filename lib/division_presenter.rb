class DivisionPresenter
  def initialize(divisions)
    @divisions = divisions
  end

  def to_s
    division_table = table do |t|
      t.headings = @divisions.collect { |d| d[0] }
      row_indexes.each do |i|
        row = []
        @divisions.each do |name, teams|
          row << teams[i]
        end
        t << row
      end
    end
    division_table
  end

  protected

  def row_indexes
    0.upto(largest_division - 1)
  end

  def largest_division
    max = 0
    @divisions.each { |d| max = d[1].length if d[1].length > max }
    max
  end
end
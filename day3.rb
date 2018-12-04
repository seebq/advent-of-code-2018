# --- Day 3: No Matter How You Slice It ---

# method to visualize
def visualize(two_dimenionsal_array)
  two_dimenionsal_array.each do |row|
    str_row = ""
    row.each do |col|
      str_row << col
    end
    puts str_row
  end
end

# fill a rectangle, if already covered put an X
def fill_rect(fabric, left_edge, top_edge, wide, tall)
  1.upto(wide) do |x|
    1.upto(tall) do |y|
      if fabric[top_edge + y][left_edge - 1 + x] == '.'
        fabric[top_edge + y][left_edge - 1 + x] = '#'
      elsif fabric[top_edge + y][left_edge - 1 + x] == '#'
        fabric[top_edge + y][left_edge - 1 + x] = 'X'
      elsif fabric[top_edge + y][left_edge - 1 + x] == 'X'
        fabric[top_edge + y][left_edge - 1 + x] = 'X'
      else
        puts "unknown, out of bounds"
      end
    end
  end
end

# returns the count of covered spaces
def count_coverage(fabric)
  covered = 0
  fabric.each do |row|
    row.each do |col|
      if col == 'X'
        covered += 1
      end
    end
  end
  covered
end

# sample data
# cols = 9
# rows = 11
# fabric = Array.new(cols) { Array.new(rows, '.') }
# fill_rect(fabric, 3, 2, 5, 4)
# fill_rect(fabric, 4, 3, 2, 2)
# visualize(fabric)
# puts count_coverage(fabric)
# ...........
# ...........
# ...........
# ...#####...
# ...#XX##...
# ...#XX##...
# ...#####...
# ...........
# ...........
# 4

# using regex: http://rubular.com/r/e6EQfSGdTB
LINE_REGEX = /^#(?<id>\d+) @ (?<left_edge>\d+),(?<top_edge>\d+): (?<wide>\d+)x(?<tall>\d+)/

fabric = Array.new(1000) { Array.new(1000, '.') }

File.foreach('day3_input.txt') do |line|
  matches = line.match(LINE_REGEX)
  fill_rect(fabric, matches[:left_edge].to_i, matches[:top_edge].to_i, matches[:wide].to_i, matches[:tall].to_i)
end
puts count_coverage(fabric) # 119572
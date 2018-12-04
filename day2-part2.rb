# --- Day 2 Part 2 ---

lines = []
lines_already_seen = []
found_one_off_line = false
common_letters = ""

# let's brute force it and check each line against all the others
# grab all the lines and toss into an array
File.foreach('day2_input.txt') do |line|
  lines << line
end

# loop over each line
lines.each do |line|
  break if found_one_off_line
  # first let's duplicate our array of lines except for the one we're looking at and the ones we've already seen
  lines_to_compare = lines.dup - [line] - lines_already_seen
  lines_to_compare.each do |line_to_compare|
    break if found_one_off_line
    error_count = 0
    common_letters = ""
    # setup a counter from 0 up to the length - 1 (since it's a 0-based array)
    0.upto(line.strip.chars.length - 1) do |idx|
      # if the characters at a given index match, let's add them to our common letters, otherwise that's an error
      if line.chars[idx] == line_to_compare.chars[idx]
        common_letters << line.chars[idx]
      else
        error_count += 1
      end
      # if 2 (or more) errors, break out, this is not it
      if error_count == 2
        break
      end
    end
    # if we got all the way to the end and only one error, we found it
    if error_count == 1
      found_one_off_line = true
      break
    end
  end
  # add this line to the ones we've already seen
  lines_already_seen << line
end

puts common_letters # srijafjzloguvlntqmphenbkd
# --- Day 2: Inventory Management System ---

seen_exactly_twice_count = 0
seen_exactly_thrice_count = 0

File.foreach('day2_input.txt') do |line|
  letter_frequencies = Hash.new(0)
  line.chars.each do |c|
    letter_frequencies[c] += 1
  end
  seen_exactly_twice_count += 1 if letter_frequencies.values.include?(2)
  seen_exactly_thrice_count += 1 if letter_frequencies.values.include?(3)
end

puts seen_exactly_twice_count * seen_exactly_thrice_count # 6944

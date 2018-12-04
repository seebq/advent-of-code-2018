# --- Day 1 Part Two ---

frequency = 0
frequencies_seen = Hash.new(0)
frequency_seen_twice = false

until frequency_seen_twice
  File.foreach('day1_input.txt') do |line|
    # the operator + or - is the first character:
    operator = line[0]
    # the calibration is the rest of it, converted to an integer
    calibration = line[1, line.length].to_i
    # just send (metaprogramming) it to perform the operation:
    frequency = frequency.send(operator, calibration)
    # store it:
    frequencies_seen[frequency] += 1
    # if we've seen a frequency twice, store it and break from loop
    if frequencies_seen[frequency] == 2
      frequency_seen_twice = frequency
      break
    end
  end
end

puts frequency_seen_twice # 81204

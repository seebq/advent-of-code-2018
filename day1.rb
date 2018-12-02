# --- Day 1: Chronal Calibration ---

frequency = 0

File.foreach('day1_input.txt') do |line|
  # the operator + or - is the first character:
  operator = line[0]
  # the calibration is the rest of it, converted to an integer
  calibration = line[1, line.length].to_i
  # just send (metaprogramming) it to perform the operation:
  frequency = frequency.send(operator, calibration)
end

puts frequency # 599
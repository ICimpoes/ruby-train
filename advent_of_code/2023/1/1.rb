lines = File.read('advent_of_code/2023/1/in.txt')

sum = 0

lines.each_line do |line|
  line.chop
  first, last = nil
  line.each_char do |char|
    next unless char =~ /[0-9]/

    pp char
    last = char.to_i
    first = char.to_i if first.nil?
  end
  sum += first * 10 + last
end

pp sum

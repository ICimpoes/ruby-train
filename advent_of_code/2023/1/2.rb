lines = File.read('advent_of_code/2023/1/in.txt')

# lines = "two1nine
# eightwothree
# abcone2threexyz
# xtwone3four
# 4nineeightseven2
# zoneight234
# 7pqrstsixteen
# sixrthreeseven74oneightsslnine "

digits = %w[one two three four five six seven eight nine]

sum = 0

lines.each_line do |line|
  line.chop!
  result = [[], []]
  line.each_char do |char|
    if char =~ /[0-9]/
      val = char.to_i
      result[1].append(val)
    else
      result[0].append('')
      res = result[0].each_with_object([[], []]) do |p, res|
        p += char
        if digits.include?(p)
          val = digits.find_index(p) + 1
          res[1].append(val)
        elsif digits.find { |d| d.start_with?(p) }
          res[0].append(p)
        end
      end
      result[0] = res[0]
      result[1] += res[1]
    end
  end

  puts "#{line} #{result.first}, #{prev.last}"
  sum += result[1].first * 10 + prev[1].last
end

pp sum

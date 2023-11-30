# frozen_string_literal: true

sum = 0
[1, 2, 3, 4].each do |v|
  sum += v * v
end

puts sum

value = 'some'

sum = 0
(1..5).each do |value|
  sum += value
end

puts sum
puts value

square = 'square'

(1..5).each do |value; square|
  square = value * value
  sum += square
end

puts sum
puts square

def two_times
  yield
  yield
end

two_times { puts 1 }

def two_times_args
  yield 1
  yield 1, 2
end

two_times_args { |v| puts "#{v}" }
two_times_args { |v, w| puts "#{v} + #{w}" }

def fib(max)
  i1 = 1
  i2 = 1
  while i1 <= max
    yield i1
    i1, i2 = i2, i1 + i2
  end
end

fib(1000) { |i| puts i }

(1..10).each { |x| puts x }

pp 'find'
pp((1..10).find { |x| x * x > 30 })
pp 'collect'
pp((1..10).collect { |x| x * x })

pp 'file'
f = File.open('ch4/test')
f.each.with_index do |line, index|
  puts "Line #{index} is: #{line}"
end
f.close

pp 'inject'
pp([1, 3, 5, 7].inject(0) { |sum, v| sum + v })
pp([1, 3, 5, 7].inject(:+))
pp([1, 3, 5, 7].inject(1) { |prod, v| prod * v })
pp([1, 3, 5, 7].inject(:*))

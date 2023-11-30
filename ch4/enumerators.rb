# frozen_string_literal: true

def puts_enum(e)
  puts e.next
rescue StopIteration => e
  pp 'stop iteration'
end

a = [1, 3, 'cat']
h = { dog: 'canine', fox: 'vulpine' }

enum_a = a.to_enum
enum_h = h.to_enum

pp enum_a.next
pp enum_a.next
pp enum_a.next
begin
  enum_a.next
rescue StandardError => e
  pp "enum next err: #{e}"
end
k, v = enum_h.next
pp "#{k} -> #{v}"

a = [1, 3, 'a']
enum_each = a.each
pp enum_each.size
pp enum_each.next
pp enum_each.size
pp "#{enum_each.next}, #{enum_each.next}, #{enum_each.size}"

puts_enum(enum_each)

enum_a = (1..10).to_enum

loop do
  puts enum_a.next
end

enum_with_index = ('a'..'f').to_enum.each_with_index
loop do
  v, i = enum_with_index.next
  puts "#{v} - #{i}"
end

'cat'.each_char.with_index { |item, index| puts "#{item}, #{index}" }

enum = 'cat'.enum_for(:each_char)
loop do
  puts enum.next
end

enum = (1..11).enum_for(:each_slice, 3)
pp enum.to_a

triangular_number = Enumerator.new do |y|
  number = 0
  count = 1
  loop do
    number += count
    count += 1
    pp "#{number}, #{count}"
    y.yield number
  end
end

50.times { print triangular_number.next, ' ' }
puts

p triangular_number.first(10)

def infinite_select(enum, &block)
  Enumerator.new do |y|
    enum.each do |val|
      y.yield(val) if block.call(val)
    end
  end
end

p infinite_select(triangular_number) { |v| v % 10 == 0 }.first(5)

class Enumerator
  def infinite_select(&block)
    Enumerator.new do |y|
      each do |val|
        y.yield(val) if block.call(val)
      end
    end
  end
end

p(triangular_number
  .infinite_select { |v| (v % 10).zero? }
  .infinite_select { |v| v.to_s =~ /3/ }
  .first(10))

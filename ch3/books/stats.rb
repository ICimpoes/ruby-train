#!/usr/bin/ruby

require_relative 'books'

reader = CsvReader.new

ARGV.each do |file_name|
  reader.read(file_name)
end

puts reader.total_value_in_stock
puts reader.number_of_each_isbn

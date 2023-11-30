#!/usr/bin/ruby
# frozen_string_literal: true

def words(string)
  string.downcase.scan(/[\w']+/)
end

def count(words)
  h = Hash.new(0)
  words.each do |w|
    h[w] += 1
  end
  h
end

text = %(The problem breaks down into two parts.
First, given some text as a string, return a list of words.
That sounds like an array.
Then, build a count for each distinct word.
That sounds like a use for a hash---we can index it with the word and use the corresponding entry to keep a count.)

word_count = count(words(text))

sorted = word_count.sort_by { |_, cnt| cnt }

sorted.last(5).each do |word, count|
  puts "#{word} - #{count}"
end

puts(sorted.last(5).map { |word, count| "#{word} #{count}" })

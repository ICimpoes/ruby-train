person = 'Tim'
second = person
person[0] = 'J'
pp person
pp second
# dup - clones
third = person.dup
person[0] = 'B'
pp person
pp second
pp third

class Library
  attr_accessor :books, :name
end

l1 = Library.new
l1.books = %w[1 2 3]
l1.name = 'Shool lbr'

l2 = l1
l1.books << '4'
pp l1
pp l2
# shallow copy
l3 = l1.dup
l1.books << '5'
l1.name = '#1'
pp l1
pp l2
pp l3

l1.freeze
begin
  l1.name = '#1'
rescue StandardError => e
  pp "ups #{e}"
end

l1.books << '#1'
pp l1.books

l1.books.freeze
begin
  l1.books << '2'
rescue StandardError => e
  pp "ups #{e}"
end

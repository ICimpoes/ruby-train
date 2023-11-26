# frozen_string_literal: true

require 'csv'

class BooksInStock
  attr_accessor :price
  attr_reader :isbn

  def initialize(isbn, price)
    @isbn = isbn
    @price = Float(price)
  end

  def price_in_cents=(cents)
    @price = cents / 100.0
  end

  def to_s
    "ISBN: #{@isbn}, price: #{@price}"
  end
end

class CsvReader
  def initialize
    @books_in_stock = []
  end

  def read(file_name)
    CSV.foreach(file_name, headers: true) do |row|
      @books_in_stock << BooksInStock.new(row['ISBN'], row['Price'])
    end
  end

  def total_value_in_stock
    @books_in_stock.sum(&:price)
  end

  def number_of_each_isbn
    isbns = Hash.new(0)
    @books_in_stock.each do |book|
      isbns[book.isbn] += 1
    end
    isbns
  end
end

# b1 = BooksInStock.new('isb1', 3)
# puts b1
#
# b2 = BooksInStock.new('isb2', 3.14)
# puts b2
#
# b3 = BooksInStock.new('isb3', '5.3')
# puts b3
# puts b3.price
# puts b3.isbn
#
# b3.price = 12
# puts b3.price
# b3.price *= 3
# puts b3.price
# b3.price += 1
# puts b3.price
#
# puts Integer((33.8 * 100).round)
#
# b3.price_in_cents = 10
# puts b3
#

#!/usr/bin/ruby

# class Order < ApplicationRecord
#   has_many :line_items
#   # self. - class method. Order.find_all_unpaid
#   def self.find_all_unpaid
#     where('paid = 0')
#   end
#
#   def total
#     sum = 0
#     line_items.each { |li| sum += li.total }
#   end
# end
require_relative '../modules/module'

class Greeter
  include Helper

  attr_accessor :name
  attr_reader :greeting
  attr_writer :age

  def initialize(name, greeting, age)
    @name = name
    @greeting = greeting
    @age = age
  end

  def greet
    puts generate_greeting
  end

  private

  def generate_greeting
    capitalize_words "#{@greeting}. I'm #{@name}, #{@age}"
  end
end

g = Greeter.new('X', "What's up", 19)
g.greet
g.name = 'Vasea'
g.age = 121
g.greet

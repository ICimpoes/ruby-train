require 'yaml'

class Person
  attr_accessor :name, :age, :pets

  def initialize(name, age, pets)
    @name = name
    @age = age
    @pets = pets
  end

  def say_hi
    puts "Hi, I'm #{@name}"
  end
end

# puts ['people' => [
#   Person.new('Y', 12, %w[Cat Dog]),
#   Person.new('X', 122, ['Mouse'])
# ]].to_yaml
puts YAML.dump(
  ['people' => [
    Person.new('Y', 12, %w[Cat Dog]),
    Person.new('X', 122, ['Mouse'])
  ]]
)

begin
  person = YAML.safe_load("!ruby/object:Person
    age: 12
    name: Y
    pets:
    - Cat
    - Dog
    - Mouse", permitted_classes: [Person])
  person.say_hi
rescue StandardError => e
  puts "error #{e}"
end
# person.say_hi

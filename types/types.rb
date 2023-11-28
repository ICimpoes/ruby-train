puts '------------------------------------'
puts 'strings'
def say_goodnight(name)
  "Good night, #{name.capitalize}"
end

puts say_goodnight('ilia')
puts say_goodnight('cicisa')

puts '------------------------------------'
puts 'arrays'
a = [1, 'cat', 3.14]
puts a
puts a[0]
puts a[2]
a[2] = nil
puts a

class Person
  attr_accessor :age

  def initialize(age)
    @age = age
  end

  def to_s
    "Person {age: #{@age}}"
  end
end

people = [Person.new(1), Person.new(18)]
ages = []

people.each { |person| ages << person.age }

puts people

puts ages

# same as animals = ['ant', 'animal', 'kozel', 'pes']
animals = %w[ant animal kozel pes]
puts animals

puts '------------------------------------'
puts 'hashes'
inst_section = {
  'cello' => 'string',
  'clarnet' => 'woodwind',
  'drum' => 'percussion'
}
puts "string => string #{inst_section}"
puts inst_section['cello']

inst_section = {
  cello: 'string',
  clarnet: 'woodwind',
  drum: 'percussion',
  trumpet: 'brass'
}

puts "symbol: string #{inst_section}"
puts inst_section[:cello]
puts inst_section[:guitar]

inst_section = {
  cello: :string,
  clarnet: :woodwind,
  drum: :percussion,
  trumpet: :brass
}

puts "symbol: :symbol #{inst_section}"
puts inst_section[:cello]
puts inst_section[:guitar]

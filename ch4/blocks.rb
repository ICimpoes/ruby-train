# frozen_string_literal: true

class File
  def self.open_and_process(*args)
    f = File.open(*args)
    yield f
    f.close
  end

  def self.my_open(*args)
    result = file = File.new(*args)
    if block_given?
      result = yield file
      file.close
    end
    result
  end
end

File.open_and_process('./ch4/test', 'r') do |file|
  while (line = file.gets)
    puts line
  end
end

f = File.my_open('./ch4/test')
p f

f.close

File.my_open('./ch4/test') do |file|
  file.each do |line|
    p line
  end
end

class ProcStore
  def pass(&block)
    # puts block
    @stored_proc = block
  end

  def exec(*args)
    @stored_proc.call(args)
  end
end

ps = ProcStore.new
ps.pass { |p| puts "params #{p}" }
ps.exec(1)
ps.exec(1, 2, 3)

def create_block(&block)
  block
end

block = create_block { |p| puts "called me with #{p}" }

block.call 9
block.call 69

block = ->(p) { puts "called me with #{p}" }
block.call 9

def n_times(val)
  ->(n) { val * n }
end

p1 = n_times(23)
pp p1.call(3)
pp p1.call(33)

p2 = n_times('sup')
pp p2.call(5)

def power(v)
  value = v
  -> { value += value }
end

p3 = power(3)
pp p3.call
pp p3.call
pp p3.call
pp p3.call

p4 = power(4)
pp p4.call
pp p4.call

def my_if(cond, then_cl, else_cl)
  if cond
    then_cl.call
  else
    else_cl.call
  end
end

5.times do |v|
  my_if v < 2,
        -> { puts "#{v} small" },
        -> { puts "#{v} big" }
end

p1 = lambda do |a, *b, &block|
  puts "a = #{a.inspect}"
  puts "b = #{b.inspect}"
  block.call
end

p1.call(1, 2, 3, 4) { puts 'in block' }

p2 = -> a, *b, &block do
  puts "a = #{a.inspect}"
  puts "b = #{b.inspect}"
  block.call
end

p2.call(1, 2, 3, 4) { puts 'in block' }

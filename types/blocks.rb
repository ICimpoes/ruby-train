distance = 10

distance *= 1.2 while distance < 100

def call_block
  puts 'calling the block'
  yield
end

call_block { puts 'test' }

def wrap(&b)
  print 'Santa says: '
  3.times(&b)
  print "\n"
end
wrap do
  print 'Wazuuup!'
end

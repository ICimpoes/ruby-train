#!/usr/bin/ruby
# frozen_string_literal: true

a = [3.14, 'pie', 99]
pp a.class
pp a.length
pp a[0]
pp a[1]
pp a[2]
pp a[3]

b = [] # Array.new
pp b.class
pp b.length
b[0] = 'second'
b[1] = 'array'
pp b
pp b[1]
pp b[2]

a = [1, 3, 5, 7, 9]
pp a[-1]
pp a[-2]
pp a[-3]
pp a[-4]
pp a[-5]
pp a[0]

pp a[2, 3] # 2 position, 3 elements
pp a[2..3] # 2, 3 position
pp a[-3, 2]
pp a[-3..-2]

a[1] = 'cat'
a[2] = [1, 3]
a[10] = 49

pp a

a = [1, 3, 5, 7, 9]

a[2, 2] = 'cat'
pp a # 1, 3, cat, 9
a[2, 0] = 'dog'
pp a # 1, 3, dog, cat, 9
a[2, 2] = [-1, -2, -3, -4]
pp a # 1, 3, -1, -2, -3, -4, 9
a[0..3] = []
pp a # -3, -4, 9
a[5..6] = [99, 100]
pp a # -3, -4, 9, nil, nil, 99, 100

stack = []
stack.push('first')
stack.push('second')
stack.push('third')
pp stack

stack.push('forth', 'fifth')
pp stack

pp stack.pop # 'fifth'
pp stack.pop(2) # [third, forth]

queue = []
queue.push(1, 2)
queue.push(3, 4)
pp queue

pp queue.shift # 1
pp queue.shift(2) # [2, 3]

a = [0, 1, 2, 3, 4]

pp a.first # 0
pp a.first(2) # [0, 1]
pp a.last # 4
pp a.last(3) # [2, 3, 4]















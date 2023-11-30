#!/usr/bin/ruby
# frozen_string_literal: true

h = { 'dog' => 'canine', 'cat' => 'feline', 'donkey' => 'asinine' }
pp h.length
pp h['dog']

h['cow'] = 'bovine'
h[12] = 'dodecine'
h['cat'] = 99
pp h

h = { dog: 'canine', cat: 'feline' }
pp h
pp h[:dog]
pp h['dog'] # nil

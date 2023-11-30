# frozen_string_literal: true

def Integer.all
  Enumerator.new do |yeilder, n: 0|
    loop { yeilder.yield(n += 1) }
  end.lazy
end

p Integer.all.first(10)

p Integer
  .all
  .select(&:even?)
  .map(&:*)

p Integer
  .all
  .select(&:even?)
  .map { |v| v * v }
  .first(10)

multiple_of_three = ->(n) { (n % 3).zero? }
palindrome = lambda { |n|
  n = n.to_s
  n == n.reverse
}

p Integer
  .all
  .select(&multiple_of_three)
  .select(&palindrome)
  .first(5)

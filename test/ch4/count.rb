require_relative '../../ch4/wc'
require 'test/unit'

class TestCount < Test::Unit::TestCase
  def test_empty
    assert_equal({}, count([]))
  end

  def test_single_word
    assert_equal({ 'cat' => 1 }, count(['cat']))
  end

  def test_many_words
    assert_equal({ 'cat' => 2, 'sat' => 1, 'down' => 1 }, count(%w[cat sat down cat]))
  end
end

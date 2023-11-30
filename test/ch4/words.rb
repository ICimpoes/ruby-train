require_relative '../../ch4/wc'
require 'test/unit'

class TestWords < Test::Unit::TestCase
  def test_empty_string
    assert_equal([], words(''))
    assert_equal([], words('  '))
  end

  def test_single_word
    assert_equal(['cat'], words('cat'))
    assert_equal(['cat'], words("   cat    !\n"))
  end

  def test_many_words
    assert_equal(%w[the cat's sat on the mat],
                 words("The cat's sat!\n on the mat"))
  end
end

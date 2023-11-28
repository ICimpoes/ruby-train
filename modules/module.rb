module Helper
  EIGHT = 8
  def capitalize_words(string)
    string.split(' ').map(&:capitalize).join(' ')
  end
end

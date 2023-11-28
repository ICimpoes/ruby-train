languages = %w[Perl Golang Python]
languages.each do |lang|
  if lang =~ /P(erl|ython)/
    puts "another scripting language #{lang}"
  else
    puts "another lang #{lang}"
  end
end

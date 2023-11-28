begin
  File.open('invalid/file')
rescue Errno::ENOENT
  warn 'file not found'
rescue StandardError => e
  warn "general error: #{e.message}"
end

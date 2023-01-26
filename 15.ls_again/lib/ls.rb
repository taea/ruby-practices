# frozen_string_literal: true

def filenames(dir, max_cols_count)
  files      = Dir.foreach(dir).reject { |f| f.start_with?('.') }.sort
  rows_count = (files.length.to_f / max_cols_count).ceil
  matrix     = files.each_slice(rows_count).to_a
  max_length = files.map(&:length).max
  Array.new(rows_count) do |row|
    matrix.map { |cols_filenames| cols_filenames[row]&.ljust(max_length + 1) }.join.rstrip
  end
end

def display(filenames)
  filenames.each do |row|
    print row
    print "\n" if row != filenames.last
  end
end

COLUMNS = 3

target = ARGV.empty? ? '.' : ARGV[0]
display(filenames(target, COLUMNS))

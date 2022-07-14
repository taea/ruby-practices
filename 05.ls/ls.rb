# frozen_string_literal: true

def find_files(dir)
  array = Dir.foreach(dir).map do |file|
    file unless file.match?(/^\./)
  end.compact
  array.sort
end

def display_files(array, rows, columns, length)
  rows.times do |row|
    columns.times { |col| print array[col][row]&.ljust(length + 1) }
    print "\n"
  end
end

current_dir    = '.'
files          = find_files(current_dir)
columns_number = 3
rows_number    = files.length / columns_number + ((files.length % columns_number).zero? ? 0 : 1)
max_length     = files.map(&:length).max
columns_array  = files.each_slice(rows_number).map(&:to_a)
display_files(columns_array, rows_number, columns_number, max_length)

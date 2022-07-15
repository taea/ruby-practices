# frozen_string_literal: true

def find_files(dir)
  array = Dir.foreach(dir).map do |file|
    file unless file.match?(/^\./)
  end.compact
  array.sort
end

def show_files(files, columns)
  rows   = files.length / columns + ((files.length % columns).zero? ? 0 : 1)
  length = files.map(&:length).max
  array  = files.each_slice(rows).map(&:to_a)
  rows.times do |row|
    columns.times { |col| print array[col][row]&.ljust(length + 1) }
    print "\n"
  end
end

current_dir    = '.'
columns_number = 3
files          = find_files(current_dir)
show_files(files, columns_number)

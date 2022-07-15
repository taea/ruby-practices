# frozen_string_literal: true

def find(dir)
  array = Dir.foreach(dir).map do |file|
    file unless file.match?(/^\./)
  end.compact
  array.sort
end

def show(files, columns)
  rows   = files.length / columns + ((files.length % columns).zero? ? 0 : 1)
  length = files.map(&:length).max
  array  = files.each_slice(rows).map(&:to_a)
  rows.times do |row|
    columns.times { |col| print array[col][row]&.ljust(length + 1) }
    print "\n"
  end
end

files = find('.')
show(files, 3)

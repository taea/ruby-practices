# frozen_string_literal: true

def find(dir)
  Dir.foreach(dir).select { |file| file unless file.start_with?(/^\./) }.sort
end

def show(files, columns)
  rows   = files.length / columns + ((files.length % columns).zero? ? 0 : 1)
  length = files.map(&:length).max
  matrix = files.each_slice(rows).to_a
  rows.times do |row|
    columns.times { |col| print matrix[col][row]&.ljust(length + 1) }
    print "\n"
  end
end

files = find('.')
show(files, 3)

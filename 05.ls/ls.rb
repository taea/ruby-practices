# frozen_string_literal: true

require 'optparse'

def find(dir, hidden_file, reverse)
  files = Dir.foreach(dir).sort
  if hidden_file && reverse
    files.reverse
  elsif hidden_file
    files
  elsif reverse
    files.reject { |file| file.start_with?('.') }.reverse
  else
    files.reject { |file| file.start_with?('.') }
  end
end

def show(files, columns)
  rows   = files.length / columns + ((files.length % columns).zero? ? 0 : 1)
  length = files.map(&:length).max
  matrix = files.each_slice(rows).to_a
  rows.times do |row|
    columns.times do |col|
      print matrix[col][row]&.ljust(length + 1)
    end
    print "\n"
  end
end

options = ARGV.getopts('a', 'r')
files = find('.', options['a'], options['r'])
show(files, 3)

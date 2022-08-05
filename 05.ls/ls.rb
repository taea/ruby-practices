# frozen_string_literal: true

require 'optparse'

def find(dir, option)
  files = Dir.foreach(dir)
  option ? files.sort : files.reject { |file| file.start_with?('.') }.sort
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

files = find('.', ARGV.getopts('a')['a'])
show(files, 3)

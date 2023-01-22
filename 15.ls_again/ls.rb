# frozen_string_literal: true

def filename(dir, max_cols_count)
  files      = Dir.foreach(dir).reject { |f| f.start_with?('.') }.sort
  rows_count = (files.length.to_f / max_cols_count).ceil
  matrix     = files.each_slice(rows_count).to_a
  max_length = files.map(&:length).max
  filenames  = []
  rows_count.times do |row|
    rows_filenames = matrix.map { |matrix| matrix[row]&.ljust(max_length + 1) }
    filenames << rows_filenames.compact
  end
  filenames
end

def show(filenames)
  filenames.each do |row|
    row.each { |filename| print filename }
    print "\n" unless row == filenames.last
  end
end

COLUMNS = 3

target = ARGV.empty? ? '.' : ARGV[0]
filenames = filename(target, COLUMNS)
show(filenames)

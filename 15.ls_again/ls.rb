# frozen_string_literal: true

def filename(dir, max_cols_count)
  files      = Dir.foreach(dir).reject { |f| f.start_with?('.') }.sort
  rows_count = (files.length.to_f / max_cols_count).ceil
  matrix     = files.each_slice(rows_count).to_a
  max_length = files.map(&:length).max
  filenames  = []
  rows_count.times do |row|
    rows_filenames = matrix.map { |cols_filenames| cols_filenames[row]&.ljust(max_length + 1) }.join.rstrip
    filenames << rows_filenames
  end
  filenames
end

def show(filenames)
  filenames.each do |row|
    print row
    print "\n" unless row == filenames.last
  end
end

COLUMNS = 3

target = ARGV.empty? ? '.' : ARGV[0]
filenames = filename(target, COLUMNS)
show(filenames)

# frozen_string_literal: true

def find(dir)
  Dir.foreach(dir).reject { |f| f.start_with?('.') }.sort
end

def show(files, max_cols_count)
  rows_count = (files.length.to_f / max_cols_count).ceil
  cols_count = files.length < max_cols_count ? files.length : max_cols_count
  matrix     = files.each_slice(rows_count).to_a
  max_length = files.map(&:length).max
  rows_count.times do |row|
    cols_count.times do |col|
      print matrix[col][row]&.ljust(max_length + 1) unless matrix[col] == nil
    end
    print "\n"
  end
end

COLUMNS = 3

target = ARGV.empty? ? '.' : ARGV[0]
files = find(target)
show(files, COLUMNS)

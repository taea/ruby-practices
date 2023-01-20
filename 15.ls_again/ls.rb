# frozen_string_literal: true

def find(dir)
  Dir.foreach(dir).reject { |f| f.start_with?('.') }.sort
end

def show(files, max_cols_count)
  rows_count = files.length / max_cols_count + ((files.length % max_cols_count).zero? ? 0 : 1)
  cols_count =
    case files.length
    when max_cols_count + 1
      max_cols_count - 1
    when 0..max_cols_count
      files.length
    else
      max_cols_count
    end
  matrix     = files.each_slice(rows_count).to_a
  max_length = files.map(&:length).max
  rows_count.times do |row|
    cols_count.times do |col|
      print matrix[col][row]&.ljust(max_length + 1)
    end
    print "\n"
  end
end

COLUMNS = 3

target = ARGV.empty? ? '.' : ARGV[0]
files = find(target)
show(files, COLUMNS)

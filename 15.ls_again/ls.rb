# frozen_string_literal: true

def find(dir)
  Dir.foreach(dir).map { |f| f unless f.start_with?('.') }.compact.sort
end

def show(files, max_cols)
  rows   = files.length / max_cols + ((files.length % max_cols).zero? ? 0 : 1)
  cols   =
    case files.length
    when max_cols + 1
      max_cols - 1
    when 0..max_cols
      files.length
    else
      max_cols
    end
  matrix = files.each_slice(rows).to_a
  length = files.map(&:length).max
  rows.times do |row|
    cols.times do |col|
      print matrix[col][row]&.ljust(length + 1)
    end
    print "\n"
  end
end

COLUMNS = 3

target = ARGV.empty? ? '.' : ARGV[0]
files = find(target)
show(files, COLUMNS)

# frozen_string_literal: true

def filenames(dir, max_cols_count)
  files      = Dir.foreach(dir).reject { |f| f.start_with?('.') }.sort
  rows_count = (files.length.to_f / max_cols_count).ceil
  col_matrix = files.each_slice(rows_count).to_a
  max_length = files.map(&:length).max
  row_matrix = Array.new(rows_count) do |row|
    col_matrix.map do |col_arrays|
      col_arrays[row]
    end
  end
  formatted_row = row_matrix.map do |row_files|
    row_files.map do |file|
      file&.ljust(max_length + 1)
    end
  end
  joined_row = formatted_row.map { |row| row.join }
  joined_row.map { |row| row.rstrip }
end

def display(filenames)
  print filenames.join("\n")
end

COLUMNS = 3

target = ARGV.empty? ? '.' : ARGV[0]
display(filenames(target, COLUMNS))

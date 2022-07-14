# frozen_string_literal: true

def find_files(dir)
  array = []
  Dir.foreach(dir) do |file|
    next if file.match?(/^\./)

    array << file
  end
  array.sort
end

def max_length(array)
  max = 0
  array.each do |item|
    max = item.length if max < item.length
  end
  max
end

def display_files(array, rows, columns, length)
  rows.times do |row|
    columns.times do |col|
      print array[col][row]&.ljust(length + 1)
    end
    print "\n"
  end
end

current_dir = '.'
columns_number = 3
files = find_files(current_dir)
rows_number = files.length / columns_number + ((files.length % columns_number).zero? ? 0 : 1)
max_length = max_length(files)
columns_array = files.each_slice(rows_number).map { |file| file.to_a }
display_files(columns_array, rows_number, columns_number, max_length)

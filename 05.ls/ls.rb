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

def split_into_column(files, files_per_column)
  columns = []
  files.each_slice(files_per_column) do |file|
    files_in_column = file.to_a
    columns << files_in_column
  end
  columns
end

def display_files(columns, files_per_column, column_number, max_length)
  files_per_column.times do |line|
    column_number.times do |n|
      print columns[n][line].ljust(max_length + 1) if columns[n][line]
    end
    print "\n"
  end
end

current_dir = '.'
column_number = 3
files = find_files(current_dir)
files_per_column = (files.length % column_number).zero? ? files.length / column_number : files.length / column_number + 1
max_length = max_length(files)
columns = split_into_column(files, files_per_column)
display_files(columns, files_per_column, column_number, max_length)

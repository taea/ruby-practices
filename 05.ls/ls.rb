# frozen_string_literal: true

def find_files(dir)
  array = Array.new
  Dir.foreach(dir) do |file|
    next if /^\./ =~ file
    array << file
  end
  array.sort
end

def max_length(array)
  max = 0
  array.each do |item|
    if max < item.length
      max = item.length
    end
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

current_dir = '.'
column_number = 3
files = find_files(current_dir)
files_per_column = files.length / column_number + 1
max_length = max_length(files)
columns = split_into_column(files, files_per_column)
# display_files(columns, files_per_column)

0.upto(files_per_column - 1).each do |line|
  0.upto(column_number - 1).each do |n|
    if columns[n][line]
      print columns[n][line].ljust(max_length + 1)
    end
  end
  print "\n"
end

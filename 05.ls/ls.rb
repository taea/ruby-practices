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

def split_into_column(files, column_number)
  files_per_column = files.length / column_number + 1
  columns = []
  files.each_slice(files_per_column) do |file|
    files_in_column = file.to_a
    columns << files_in_column
  end
  columns
end

def display_files(columns, column_number, max_length)
  files_per_column = files.length / column + 1
end
# def display_files(files, column, max_length)
#   files_per_column = files.length / column + 1
#   files.each_slice(files_per_column) do |file|
#     columns = file.to_a
#     p columns
#   end
# end

# def display_files(files, column, max_length)
#   files_per_column = files.length / column + 1
#   0.upto(files_per_column).each do |line|
#     files.each_slice(files_per_column) do |file|
#       columns = file.to_a
#       print columns[line].ljust(max_length + 1) if columns[line]
#     end
#     print "\n" unless line == files_per_column - 1
#   end
# end

current_dir = '.'
column_number = 3
files = find_files(current_dir)
max_length = max_length(files)
p columns = split_into_column(files, column_number)
# display_files(columns, 3, max_length)

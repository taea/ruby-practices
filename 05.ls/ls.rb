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

def display_files(files, column, max_length)
  files_per_column = files.length / column + 1
  0.upto(files_per_column).each do |line|
    files.each_slice(files_per_column) do |file|
      columns = file.to_a
      print columns[line].ljust(max_length + 1) if columns[line]
    end
    print "\n" unless line == files_per_column - 1
  end
end

current_dir = '.'
files = find_files(current_dir)
max_length = max_length(files)
display_files(files, 3, max_length)

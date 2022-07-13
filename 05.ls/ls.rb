# frozen_string_literal: true

def find_files(dir)
  array = Array.new
  Dir.foreach(dir) do |file|
    next if /^\./ =~ file
    array << file
  end
  array.sort
end

def display_files(files, column)
  files_per_column = files.length / column + 1
  0.upto(files_per_column).each do |line|
    files.each_slice(files_per_column) do |file|
      columns = file.to_a
      print columns[line].ljust(17) if columns[line]
    end
    print "\n" unless line == files_per_column - 1
  end
end

current_dir = '.'
files = find_files(current_dir)
display_files(files, 3)

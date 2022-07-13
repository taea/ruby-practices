# frozen_string_literal: true

require 'find'

files = []
def find_files(dir, files)
  Find.find(dir) do |file|
    file_name = File.basename(file)
    next if /^\./ =~ file_name || File.basename(dir) == file_name
    files << file_name
  end
end

def display_files(files, column)
  files_per_column = files.length / column + 1
  0.upto(files_per_column).each_with_index do |line, index|
    files.each_slice(files_per_column) do |file|
      columns = file.to_a
      print columns[line].ljust(17) if columns[line]
    end
    print "\n" unless index == files_per_column - 1
  end
end

current_dir = '.'
find_files(current_dir, files)
display_files(files, 3)

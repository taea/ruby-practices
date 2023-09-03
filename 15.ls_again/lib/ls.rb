#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'

def find(dir, hidden_files)
  files = Dir.foreach(dir).sort
  if hidden_files
    files
  else
    files.reject { |f| f.start_with?('.') }
  end
end

def order(files, reverse)
  if reverse
    files.reverse
  else
    files
  end
end

def transpose(files, cols_count)
  rows_count = (files.length.to_f / cols_count).ceil
  col_matrix = files.each_slice(rows_count).to_a
  Array.new(rows_count) do |row|
    col_matrix.map do |col_arrays|
      col_arrays[row]
    end
  end
end

def format(row_matrix)
  max_length    = row_matrix.flatten.compact.map(&:length).max
  formatted_row =
    row_matrix.map do |row_files|
      row_files.map do |file|
        file&.ljust(max_length + 1)
      end
    end
  joined_row = formatted_row.map(&:join)
  joined_row.map(&:rstrip)
end

def display(row_content)
  puts row_content.join("\n")
end

COLUMNS = 3

if __FILE__ == $PROGRAM_NAME
  options    = ARGV.getopts('a', 'r')
  target     = ARGV.empty? ? '.' : ARGV[0]
  display(format(transpose(order(find(target, options['a']), options['r']), COLUMNS)))
end

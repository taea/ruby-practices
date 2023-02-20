#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'ls_def'

COLUMNS = 3
target  = ARGV.empty? ? '.' : ARGV[0]
max_length = find(target).map(&:length).max
display(format(transpose(find(target), COLUMNS), max_length))

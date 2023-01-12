# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'ls'

class LsTest < Minitest::Test
  def test_1_file
    assert_equal '1', show(%w[1], COLUMNS)
  end

  def test_2_files
    assert_equal '1 2', show(%w[1 2], COLUMNS)
  end

  def test_3_files
    assert_equal '1 2 3', show(%w[1 2 3], COLUMNS)
  end

  def test_4_files
    assert_equal '1 3\n2 4', show(%w[1 2 3 4], COLUMNS)
  end

  def test_5_files
    assert_equal '1 3 5\n2 4', show(%w[1 2 3 4 5], COLUMNS)
  end

  def test_6_files
    assert_equal '1 3 5\n2 4 6', show(%w[1 2 3 4 5 6], COLUMNS)
  end

  def test_7_files
    assert_equal '1 4 7\n2 5\n3 6', show(%w[1 2 3 4 5 6 7], COLUMNS)
  end

  def test_8_files
    assert_equal '1 4 7\n2 5 8\n3 6', show(%w[1 2 3 4 5 6 7 8], COLUMNS)
  end

  def test_various_file_names
    assert_equal 'dir             gb              test-dir2\n' \
      'esa             ls.rb           test-dir2のコピー\n' \
      'folder          test-dir1       test-dir2のコピー2', show(
        %w[dir esa folder gb ls.rb test-dir1 test-dir2 test-dir2のコピー test-dir2のコピー2], COLUMNS
      )
  end
end

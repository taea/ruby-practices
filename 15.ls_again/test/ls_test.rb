# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/ls'
TEST_DIR = 'ls-sample/'
COLUMNS  = 3

class LsTest < Minitest::Test
  def test_1_files
    dir = "#{TEST_DIR}1"
    expected = <<~TEXT.chomp
      1
    TEXT
    assert_output(expected) { display(filenames(dir, COLUMNS)) }
  end

  def test_2_files
    dir = "#{TEST_DIR}2"
    expected = <<~TEXT.chomp
      1 2
    TEXT
    assert_output(expected) { display(filenames(dir, COLUMNS)) }
  end

  def test_3_files
    dir = "#{TEST_DIR}3"
    expected = <<~TEXT.chomp
      1 2 3
    TEXT
    assert_output(expected) { display(filenames(dir, COLUMNS)) }
  end

  def test_4_files
    dir = "#{TEST_DIR}4"
    expected = <<~TEXT.chomp
      1 3
      2 4
    TEXT
    assert_output(expected) { display(filenames(dir, COLUMNS)) }
  end

  def test_5_files
    dir = "#{TEST_DIR}5"
    expected = <<~TEXT.chomp
      1 3 5
      2 4
    TEXT
    assert_output(expected) { display(filenames(dir, COLUMNS)) }
  end

  def test_6_files
    dir = "#{TEST_DIR}6"
    expected = <<~TEXT.chomp
      1 3 5
      2 4 6
    TEXT
    assert_output(expected) { display(filenames(dir, COLUMNS)) }
  end

  def test_7_files
    dir = "#{TEST_DIR}7"
    expected = <<~TEXT.chomp
      1 4 7
      2 5
      3 6
    TEXT
    assert_output(expected) { display(filenames(dir, COLUMNS)) }
  end

  def test_8_files
    dir = "#{TEST_DIR}8"
    expected = <<~TEXT.chomp
      1 4 7
      2 5 8
      3 6
    TEXT
    assert_output(expected) { display(filenames(dir, COLUMNS)) }
  end

  def test_various_file_names
    dir = "#{TEST_DIR}long_file_name"
    expected = <<~TEXT.chomp
      dir             gb              test-dir2
      esa             ls.rb           test-dir2のコピー
      folder          test-dir1       test-dir2のコピー2
    TEXT
    assert_output(expected) { display(filenames(dir, COLUMNS)) }
  end
end

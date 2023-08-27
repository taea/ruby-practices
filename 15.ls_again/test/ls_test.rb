# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/ls'

TEST_DIR = File.join(__dir__, 'ls-sample')

class LsTest < Minitest::Test
  def test_1_files
    target   = File.join(TEST_DIR, '1')
    expected = <<~TEXT
      1
    TEXT
    assert_output(expected) { display(format(transpose(find(target, false), COLUMNS))) }
  end

  def test_2_files
    target   = File.join(TEST_DIR, '2')
    expected = <<~TEXT
      1 2
    TEXT
    assert_output(expected) { display(format(transpose(find(target, false), COLUMNS))) }
  end

  def test_3_files
    target   = File.join(TEST_DIR, '3')
    expected = <<~TEXT
      1 2 3
    TEXT
    assert_output(expected) { display(format(transpose(find(target, false), COLUMNS))) }
  end

  def test_4_files
    target   = File.join(TEST_DIR, '4')
    expected = <<~TEXT
      1 3
      2 4
    TEXT
    assert_output(expected) { display(format(transpose(find(target, false), COLUMNS))) }
  end

  def test_5_files
    target   = File.join(TEST_DIR, '5')
    expected = <<~TEXT
      1 3 5
      2 4
    TEXT
    assert_output(expected) { display(format(transpose(find(target, false), COLUMNS))) }
  end

  def test_6_files
    target   = File.join(TEST_DIR, '6')
    expected = <<~TEXT
      1 3 5
      2 4 6
    TEXT
    assert_output(expected) { display(format(transpose(find(target, false), COLUMNS))) }
  end

  def test_7_files
    target   = File.join(TEST_DIR, '7')
    expected = <<~TEXT
      1 4 7
      2 5
      3 6
    TEXT
    assert_output(expected) { display(format(transpose(find(target, false), COLUMNS))) }
  end

  def test_8_files
    target   = File.join(TEST_DIR, '8')
    expected = <<~TEXT
      1 4 7
      2 5 8
      3 6
    TEXT
    assert_output(expected) { display(format(transpose(find(target, false), COLUMNS))) }
  end

  def test_various_file_names
    target   = File.join(TEST_DIR, 'long_file_name')
    expected = <<~TEXT
      dir             gb              test-dir2
      esa             ls.rb           test-dir2_copy
      folder          test-dir1       test-dir2_copy2
    TEXT
    assert_output(expected) { display(format(transpose(find(target, false), COLUMNS))) }
  end

  def a_option
    target   = File.join(TEST_DIR, 'long_file_name')
    expected = <<~TEXT
      .               dir             test-dir1
      ..              esa             test-dir2
      .DS_Store       folder          test-dir2_copy
      .gitkeep        gb              test-dir2_copy2
      .vscode         ls.rb
    TEXT
    assert_output(expected) { display(format(transpose(find(target, true), COLUMNS))) }
  end
end

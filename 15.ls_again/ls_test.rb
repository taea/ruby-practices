# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'ls'

class LsTest < Minitest::Test
  def test_1_files
    expected = <<~EOS.chomp
      1
    EOS
    actual = show(%w[1], COLUMNS)
    assert_equal expected, actual
  end

  def test_2_files
    expected = <<~EOS.chomp
      1 2
    EOS
    actual = show(%w[1 2], COLUMNS)
    assert_equal expected, actual
  end

  def test_3_files
    expected = <<~EOS.chomp
      1 2 3
    EOS
    actual = show(%w[1 2 3], COLUMNS)
    assert_equal expected, actual
  end

  def test_4_files
    expected = <<~EOS.chomp
      1 2 3
      4
    EOS
    actual = show(%w[1 2 3 4], COLUMNS)
    assert_equal expected, actual
  end

  def test_5_files
    expected = <<~EOS.chomp
      1 3 5
      2 4
    EOS
    actual = show(%w[1 2 3 4 5], COLUMNS)
    assert_equal expected, actual
  end

  def test_6_files
    expected = <<~EOS.chomp
      1 3 5
      2 4 6
    EOS
    actual = show(%w[1 2 3 4 5 6], COLUMNS)
    assert_equal expected, actual
  end

  def test_7_files
    expected = <<~EOS.chomp
      1 4 7
      2 5
      3 6
    EOS
    actual = show(%w[1 2 3 4 5 6 7], COLUMNS)
    assert_equal expected, actual
  end

  def test_8_files
    expected = <<~EOS.chomp
      1 4 7
      2 5 8
      3 6
    EOS
    actual = show(%w[1 2 3 4 5 6 7 8], COLUMNS)
    assert_equal expected, actual
  end

  def test_various_file_names
    expected = <<~EOS.chomp
      dir             gb              test-dir2
      esa             ls.rb           test-dir2のコピー
      folder          test-dir1       test-dir2のコピー2
    EOS
    actual = show(
      %w[
        dir esa folder
        gb ls.rb test-dir1
        test-dir2 test-dir2のコピー test-dir2のコピー2
      ],
      COLUMNS
    )
    assert_equal expected, actual
  end
end

# frozen_string_literal: true

require 'minitest/autorun'

TEST_DIR = File.join(__dir__, 'ls-sample')
LOAD_DIR = File.join(__dir__, '../lib/ls.rb')

class LsTest < Minitest::Test
  def test_1_file
    target = File.join(TEST_DIR, '1')
    expected = <<~TEXT.chomp
      1
    TEXT
    $stdout = StringIO.new
    ARGV[0] = target
    load LOAD_DIR
    out = $stdout.string
    assert_equal expected, out.chomp
  end

  def test_2_files
    target   = File.join(TEST_DIR, '2')
    expected = <<~TEXT.chomp
      1 2
    TEXT
    $stdout = StringIO.new
    ARGV[0] = target
    load LOAD_DIR
    out = $stdout.string
    assert_equal expected, out.chomp
  end

  def test_3_files
    target   = File.join(TEST_DIR, '3')
    expected = <<~TEXT.chomp
      1 2 3
    TEXT
    $stdout = StringIO.new
    ARGV[0] = target
    load LOAD_DIR
    out = $stdout.string
    assert_equal expected, out.chomp
  end

  def test_4_files
    target   = File.join(TEST_DIR, '4')
    expected = <<~TEXT.chomp
      1 3
      2 4
    TEXT
    $stdout = StringIO.new
    ARGV[0] = target
    load LOAD_DIR
    out = $stdout.string
    assert_equal expected, out.chomp
  end

  def test_5_files
    target   = File.join(TEST_DIR, '5')
    expected = <<~TEXT.chomp
      1 3 5
      2 4
    TEXT
    $stdout = StringIO.new
    ARGV[0] = target
    load LOAD_DIR
    out = $stdout.string
    assert_equal expected, out.chomp
  end

  def test_6_files
    target   = File.join(TEST_DIR, '6')
    expected = <<~TEXT.chomp
      1 3 5
      2 4 6
    TEXT
    $stdout = StringIO.new
    ARGV[0] = target
    load LOAD_DIR
    out = $stdout.string
    assert_equal expected, out.chomp
  end

  def test_7_files
    target   = File.join(TEST_DIR, '7')
    expected = <<~TEXT.chomp
      1 4 7
      2 5
      3 6
    TEXT
    $stdout = StringIO.new
    ARGV[0] = target
    load LOAD_DIR
    out = $stdout.string
    assert_equal expected, out.chomp
  end

  def test_8_files
    target   = File.join(TEST_DIR, '8')
    expected = <<~TEXT.chomp
      1 4 7
      2 5 8
      3 6
    TEXT
    $stdout = StringIO.new
    ARGV[0] = target
    load LOAD_DIR
    out = $stdout.string
    assert_equal expected, out.chomp
  end

  def test_various_file_names
    target   = File.join(TEST_DIR, 'long_file_name')
    expected = <<~TEXT.chomp
      dir             gb              test-dir2
      esa             ls.rb           test-dir2_copy
      folder          test-dir1       test-dir2_copy2
    TEXT
    $stdout = StringIO.new
    ARGV[0] = target
    load LOAD_DIR
    out = $stdout.string
    assert_equal expected, out.chomp
  end
end

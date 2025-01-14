require 'optparse'
require 'date'

def calendar(year, month)
  puts "      #{month}月 #{year}"
  puts "日 月 火 水 木 金 土"
  (Date.new(year, month, 1)..Date.new(year, month, -1)).each do |date|
    day = date.day.to_s.rjust(2)
    print "\s" * 3 * date.wday if date.day == 1
    print date == Date.today ? "\e[30;47m#{day}\e[0m" : day
    print date.saturday? ? "\n" : "\s"
  end
end

options = ARGV.getopts('y:', 'm:')
year = options['y'] || Date.today.year
month = options['m'] || Date.today.month

calendar(year.to_i, month.to_i)

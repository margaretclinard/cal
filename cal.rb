#!/usr/bin/env ruby

require_relative 'lib/month'
require_relative 'lib/year'

def year_range_error
  puts <<EOS
Date not in acceptable format/range.
`./cal.rb mm yyyy`
EOS
end


if ARGV.length == 2
  month = ARGV[0].to_i
  year = ARGV[1].to_i

  if year > 3000 || year < 1800
    year_range_error
  else
    m = Month.new(month, year)
    puts m.to_s
  end

elsif ARGV.length == 1
  year = ARGV[0].to_i

  y = Year.new(year)
  puts y.display
end


#!/usr/bin/env ruby

require_relative 'lib/month'

month = ARGV[0].to_i
year = ARGV[1].to_i

def year_range_error
  puts <<EOS
Date not in acceptable format/range.
`./cal.rb mm yyyy`
EOS
end

if year > 3000 || year < 1800
  year_range_error
else
  m = Month.new(month, year)
  puts m
end

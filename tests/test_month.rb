require_relative 'helper'
require_relative '../lib/month'

class TestMonth < Minitest::Test

  def test_initializing_a_month_saves_values
    m = Month.new(05, 2015)
    assert_equal 05, m.month
    assert_equal 2015, m.year
  end

  def test_to_s_on_jan_2012
    m = Month.new(01, 2012)
    expected = <<EOS
    January 2012
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
    assert_equal expected, m.to_s
  end

  def test_to_s_on_march_2017
    m = Month.new(03, 2017)
    expected = <<EOS
     March 2017
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31

EOS
    assert_equal expected, m.to_s
  end

  def test_name_on_march
    m = Month.new(03, 2009)
    assert_equal m.name, "March"
  end

  def test_name_on_january
    m = Month.new(01, 2009)
    assert_equal m.name, "January"
  end

  def test_name_on_december
    m = Month.new(12, 2009)
    assert_equal m.name, "December"
  end

  def test_day_count_months_with_30_days
    m = Month.new(11, 2009)
    assert_equal m.day_count, 30
  end

  def test_day_count_months_with_31_days
    m = Month.new(07, 1999)
    assert_equal m.day_count, 31
  end

  def test_day_count_leap_year_29_days
    m = Month.new(02, 1904)
    assert_equal m.day_count, 29
  end

  def test_day_count_non_leap_year_28_days
    m = Month.new(02, 1900)
    assert_equal m.day_count, 28
  end

  def test_print_days_in_month_may
    m = Month.new(04, 2003)
    expected = <<EOS
     April 2003
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30

EOS
    assert_equal expected, m.print_days_in_month
  end

  def test_print_days_in_month_february_leap_year
    m = Month.new(02, 2004)
    expected = <<EOS
   February 2004
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29

EOS
    assert_equal expected, m.print_days_in_month
  end
end

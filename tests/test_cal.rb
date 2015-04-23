require_relative 'helper'

class TestCal < Minitest::Test

  def test_month_starts_on_sunday
    output = `./cal.rb 01 2012`
    expected = <<EOS
    January 2012
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
    assert_equal expected, output
  end

  def test_regular_leap_years
    output = `./cal.rb 02 1804`
    expected = <<EOS
   February 1804
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29

EOS
    assert_equal expected, output
  end

  def test_century_leap_years
    output = `./cal.rb 02 2000`
    expected = <<EOS
   February 2000
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29

EOS
    assert_equal expected, output
  end

  def test_400_year_leap_years
    output = `./cal.rb 02 2400`
    expected = <<EOS
   February 2400
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29

EOS
    assert_equal expected, output
  end

  def test_min_date_1800
    output = `./cal.rb 04 1776`
    expected = <<EOS
Date not in acceptable format/range.
`./cal.rb mm yyyy`
EOS
    assert_equal expected, output
  end

  def test_max_date_3000
    output = `./cal.rb 04 3001`
    expected = <<EOS
Date not in acceptable format/range.
`./cal.rb mm yyyy`
EOS
    assert_equal expected, output
  end

  def test_invalid_date_format
    output = `./cal.rb 04 05 2006`
    expected = <<EOS
Date not in acceptable format/range.
`./cal.rb mm yyyy`
EOS
    assert_equal expected, output
  end

  def test_earliest_date
    output = `./cal.rb 01 1800`
    expected = <<EOS
    January 1800
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31

EOS
    assert_equal expected, output
  end

  def test_latest_date
    output = `./cal.rb 12 3000`
    expected = <<EOS
   December 3000
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31

EOS
    assert_equal expected, output
  end

  def test_january
    output = `./cal.rb 01 1999`
    expected = <<EOS
    January 1999
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30
31
EOS
    assert_equal expected, output
  end

  def test_february_non_leap_year
    output = `./cal.rb 02 2007`
    expected = <<EOS
   February 2007
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28

EOS
    assert_equal expected, output
  end

  def test_february_leap_year
    output = `./cal.rb 02 2008`
    expected = <<EOS
   February 2008
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29

EOS
    assert_equal expected, output
  end

  def test_march
    output = `./cal.rb 03 2003`
    expected = <<EOS
     March 2003
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
EOS
    assert_equal expected, output
  end

  def test_april
    output = `./cal.rb 04 2003`
    expected = <<EOS
     April 2003
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30

EOS
    assert_equal expected, output
  end

  def test_may
    output = `./cal.rb 05 2006`
    expected = <<EOS
      May 2006
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31

EOS
    assert_equal expected, output
  end

  def test_june
    output = `./cal.rb 06 2022`
    expected = <<EOS
     June 2022
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30

EOS
    assert_equal expected, output
  end

  def test_july
    output = `./cal.rb 07 2044`
    expected = <<EOS
     July 2044
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30
31
EOS
    assert_equal expected, output
  end

  def test_august
    output = `./cal.rb 08 2057`
    expected = <<EOS
    August 2057
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31

EOS
    assert_equal expected, output
  end

  def test_september
    output = `./cal.rb 09 1876`
    expected = <<EOS
   September 1876
Su Mo Tu We Th Fr Sa
                1  2
 3  4  5  6  7  8  9
10 11 12 13 14 15 16
17 18 19 20 21 22 23
24 25 26 27 28 29 30

EOS
    assert_equal expected, output
  end

  def test_october
    output = `./cal.rb 10 1898`
    expected = <<EOS
    October 1898
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
EOS
    assert_equal expected, output
  end

  def test_november
    output = `./cal.rb 11 1900`
    expected = <<EOS
   November 1900
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30

EOS
    assert_equal expected, output
  end

  def test_december
    output = `./cal.rb 12 1970`
    expected = <<EOS
   December 1970
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30 31

EOS
    assert_equal expected, output
  end

end

require_relative 'helper'
require_relative '../lib/day'

class TestDay < Minitest::Test

  def test_day_of_week_sunday_and_edgecase_january
    day = Day.day_of_week(01, 2012)
    assert_equal 1, day
  end

  def test_day_of_week_saturday_and_edgecase_february
    day = Day.day_of_week(02, 2014)
    assert_equal 0, day
  end

  def test_day_of_week_monday
    day = Day.day_of_week(03, 1999)
    assert_equal 2, day
  end

  def test_day_of_week_friday
    day = Day.day_of_week(04, 1870)
    assert_equal 6, day
  end

  def test_day_of_week_leap_year
    day = Day.day_of_week(03, 2004)
    assert_equal 2, day
  end

  def test_day_of_week_non_leap_year
    day = Day.day_of_week(03, 2005)
    assert_equal 3, day
  end

end

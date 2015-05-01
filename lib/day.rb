# This class implements Zeller's congruence:
  # Resource: http://en.wikipedia.org/wiki/Zeller's_congruence
  # The return value is the first weekday of the month, where:
    # (0 = Saturday, 1 = Sunday, 2 = Monday, ..., 6 = Friday)
  # day is the date of the month
  # m is the month
    # (3 = March, 4 = April, 5 = May, ..., 14 = February)
  # y is the year

class Day

  def self.day_of_week(month, day, year)
    m = month
    y = year

    # NOTE: January and February are counted as months 13 and 14 of the previous year.
    m = 13 if month == 1
    m = 14 if month == 2
    y = year - 1 if m > 12

    first_weekday_of_month = (day + (((m + 1) * 26)/10) + y + (y/4) + (6 * (y/100)) + (y/400)) % 7
    first_weekday_of_month
  end

end

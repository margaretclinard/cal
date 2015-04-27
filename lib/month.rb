require_relative 'day'

class Month
  attr_reader :month, :year

  def initialize(month, year)
    @month = month
    @year = year
    @first_weekday_of_month = Day.day_of_week(@month, @year)
  end

  WEEKDAYS = "Su Mo Tu We Th Fr Sa"

  def name
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    months[@month - 1]
  end

  def day_count
    months_with_30 = [9, 4, 6, 11]
    months_with_31 = [1, 3, 5, 7, 8, 10, 12]

    if months_with_30.include? @month
      30
    elsif months_with_31.include? @month
      31
    elsif (@year % 4 == 0) && !(@year % 100 == 0) || (@year % 400 == 0)
      29
    else
      28
    end
  end

  def to_s
    month_year = <<EOS
 #{name} #{year}
EOS
    month_year.center(20).rstrip + "\n" + <<EOS
#{WEEKDAYS}
#{print_days_in_month}
EOS
  end

  def print_days_in_month
    days = (1..day_count).to_a
    days.map! do |day|
      if day < 10
        " " + day.to_s
      else
        day.to_s
      end
    end

    (@first_weekday_of_month - 1).times do
      placeholder_day = "  "
      days.unshift(placeholder_day)
    end

    days.join(" ")
  end

end

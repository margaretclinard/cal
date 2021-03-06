require_relative 'day'

class Month
  attr_reader :month, :year
  WEEKDAYS = "Su Mo Tu We Th Fr Sa"

  def initialize(month, year)
    @month = month
    @year = year
    @first_weekday_of_month = Day.day_of_week(@month, 1, @year)
  end

  def name
    months = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    months[@month]
  end

  def leap_year?
    (@year % 4 == 0) && !(@year % 100 == 0) || (@year % 400 == 0)
  end

  def day_count
    months_with_30 = [9, 4, 6, 11]
    months_with_31 = [1, 3, 5, 7, 8, 10, 12]

    if months_with_30.include? @month
      30
    elsif months_with_31.include? @month
      31
    elsif leap_year?
      29
    else
      28
    end
  end

  def to_s
    month_year = "#{name} #{year}"
    <<EOS
#{month_year.lstrip.center(20).rstrip}
#{WEEKDAYS}
#{print_days_in_month}
EOS
  end

  def print_days_in_month
    days_string = ""
    days_array = (1..day_count).to_a

    days_array.map! do |day|
      if day < 10
        " " + day.to_s
      else
        day.to_s
      end
    end

    if @first_weekday_of_month > 0
      (@first_weekday_of_month - 1).times do
        placeholder_day = "  "
        days_array.unshift(placeholder_day)
      end
    else # This takes into account the blank spaces for Saturdays, since Saturday is 0 in Zeller's
      (@first_weekday_of_month + 6).times do
        placeholder_day = "  "
        days_array.unshift(placeholder_day)
      end
    end

    days_array.each_slice(7) do |a|
      days_string << a.join(" ") + "\n"
    end

    max_days_array_size = 36
    min_days_array_size = 28

    if days_array.size >= max_days_array_size
      days_string.rstrip
    elsif days_array.size <= min_days_array_size
      days_string + "\n"
    else
      days_string
    end
  end

end

class Month
  attr_reader :month, :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  WEEKDAYS = "Su Mo Tu We Th Fr Sa"

  def to_s
    <<EOS
    #{name} #{year}
#{WEEKDAYS}
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
  end

  def name
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    months[@month - 1]
  end
end

require_relative 'month'

class Year
  attr_reader :year

  def initialize(year)
    @year = year
  end

  def display
    <<EOS
#{display_year}
#{display_months}
EOS
  end

  def display_year
    "#{@year}".center(62).rstrip + "\n"
  end

  def display_months
    months_array = []

    (1..12).each do |month|
      m = Month.new(month, @year).to_s.split("\n")
      months_array.push(m)
    end

    months_string = ""

    months_array.each_slice(3) do |row|
      months_string << "#{row[0][0][0...-5].lstrip.center(20)}  #{row[1][0][0...-5].lstrip.center(20)}  #{row[2][0][0...-5].lstrip.center(20).rstrip}\n"
      months_string << "#{row[0][1]}  #{row[1][1]}  #{row[2][1]}\n"
      months_string << "#{row[0][2]}  #{row[1][2]}  #{row[2][2]}\n"
      months_string << "#{row[0][3]}  #{row[1][3]}  #{row[2][3]}\n"
      months_string << "#{row[0][4]}  #{row[1][4]}  #{row[2][4]}\n"
      months_string << "#{row[0][5]}  #{row[1][5]}  #{row[2][5]}\n"
      months_string << "#{row[0][6].ljust(20)}  #{row[1][6].ljust(20)}  #{row[2][6].ljust(20)}\n"

      if row[0][7].nil? && row[1][7].nil? && row[2][7].nil?
        months_string << "\n"
      elsif row[0][7]
        row[1][7] = "                    "
        row[2][7] = "                    "
        months_string << "#{row[0][7].ljust(20)}  #{row[1][7]}  #{row[2][7]}\n"
      elsif row[1][7]
        row[0][7] = "                    "
        row[2][7] = "                    "
        months_string << "#{row[0][7]}  #{row[1][7].ljust(20)}  #{row[2][7]}\n"
      elsif row[2][7]
        row[0][7] = "                    "
        row[1][7] = "                    "
        months_string << "#{row[0][7]}  #{row[1][7]}  #{row[2][7].ljust(20).rstrip}\n"
      end
    end

    months_string.rstrip
  end
end

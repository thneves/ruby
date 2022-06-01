require 'pry'

class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  CARS_PER_HOUR = 221

  def success_rate(result)
    case @speed
    when 5..8
      calc_percentage(90, result)
    when 9
      calc_percentage(80, result)
    when 10
      calc_percentage(77, result)
    else
      result
    end
  end

  def calc_percentage(num, result)
    ((num.to_f / 100) * result)
  end

  def production_rate_per_hour
    result = @speed * CARS_PER_HOUR
    success_rate(result)
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end
end







require_relative "bike"

class DockingStation
  attr_reader :docked_bikes


  def initialize
    @docked_bikes = []
  end

  def release_bike
    if @docked_bikes.length == 0
      raise "No bikes"
    else
    return @docked_bikes.pop
    end
  end

  def dock_bike(bike)
    @docked_bikes << bike
    @docked_bikes.last #return last stored bike, to check bike was stored correctly
  end

end


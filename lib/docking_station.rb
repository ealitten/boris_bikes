require_relative "bike"

class DockingStation
  attr_reader :docked_bikes, :capacity

  def initialize(capacity=20)
    @docked_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "No bikes available" unless @docked_bikes.length > 0
    @docked_bikes.pop
  end

  def dock_bike(bike)
    raise "No space in docking station" unless @docked_bikes.length < @capacity
    @docked_bikes << bike
    @docked_bikes.last #return last stored bike, to check bike was stored correctly
  end

end


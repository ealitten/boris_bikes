require_relative "bike"

class DockingStation

  attr_reader :docked_bikes, :capacity

  def initialize(capacity=20)
    @docked_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "No bikes available" if empty?
    @docked_bikes.pop
  end

  def dock_bike(bike)
    raise "No space in docking station" if full?
    @docked_bikes << bike
    @docked_bikes.last #return last stored bike, to check bike was stored correctly
  end

  private

  def full?
    @docked_bikes.length >= @capacity
  end

  def empty?
    @docked_bikes.empty?
  end

end


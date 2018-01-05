require_relative "bike"

class DockingStation

  attr_reader :docked_bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "No bikes available" if empty?
    raise "Bike not working" unless @docked_bikes.last.working?
    @docked_bikes.pop
  end

  def release_broken_bikes
    raise "No bikes available" if empty?
    @docked_bikes, broken_bikes = @docked_bikes.partition{|bike| bike.working?}
    broken_bikes
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


require_relative 'docking_station'
require_relative 'garage'

class Van

    def collect_bikes(target)
        @bikes_in_van = target.release_broken_bikes if target.is_a? DockingStation
        @bikes_in_van = target.release_fixed_bikes if target.is_a? Garage
        @bikes_in_van
    end

    def deliver(target)
        raise "Van is empty" if @bikes_in_van.nil?
        @bikes_in_van.reverse_each do |bike|
          target.dock_bike(bike)
          @bikes_in_van.pop
        end
        @bikes_in_van
    end

end

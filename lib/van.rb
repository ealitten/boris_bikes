require_relative 'docking_station'

class Van

    def collect_broken_bikes(docking_station)
        @bikes_in_van = docking_station.release_broken_bikes
        @bikes_in_van
    end

    def collect_fixed_bikes
        #bikes in van = garage.release_bikes
    end   


    def deliver(target)
        # raise exception if van empty
        # for all bikes in van, target.dock_bike
    end

end
require_relative 'bike'

class Garage
    attr_reader :broken_bikes, :fixed_bikes

    def initialize
        @broken_bikes = []
        @fixed_bikes = []
      end

      def release_fixed_bikes
        raise "No fixed bikes" if @fixed_bikes.empty?
        @bikes_to_release = @fixed_bikes
        @fixed_bikes.clear
        @bikes_to_release
      end

    def fix_bikes
        @fixed_bikes << @broken_bikes
        @broken_bikes.clear
    end
end
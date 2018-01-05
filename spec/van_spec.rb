require 'van'

describe Van do
    describe "#collect_bikes" do
        it "should collect broken bikes from station" do
            bike = double(:bike, :working? => false)
            docking_station = DockingStation.new
            3.times{docking_station.dock_bike(bike)}
            expect(subject.collect_bikes(docking_station)).to eq [bike,bike,bike]
        end

        it "should collect fixed bikes from garage" do
            bike = double(:bike, :working? => true)
            garage = double(:garage, :release_bikes => [bike,bike,bike])
            expect(subject.collect_bikes(garage)).to eq [bike,bike,bike]
        end
    end

    describe "#deliver" do

      context "when van is empty" do
        before { subject.instance_variable_set(:@bikes_in_van, nil) }
        it "should raise an exception" do
          expect{ subject.deliver double(:garage) }.to raise_error("Van is empty")
        end
      end

      context "when van has bikes" do
        let (:bike) { double :bike }
        before { subject.instance_variable_set(:@bikes_in_van, [bike, bike, bike])}
        it "should deliver them to target" do
          expect( subject.deliver DockingStation.new ).to eq []
        end
      end

    end
end

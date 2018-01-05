require 'van'

describe Van do
    describe "#collect_broken_bikes" do
        it "should collect bikes from station" do
            bike = double(:bike, :working? => false)
            docking_station = double(:docking_station, :release_broken_bikes => [bike,bike,bike])
            expect(subject.collect_broken_bikes(docking_station)).to eq [bike,bike,bike]
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
        it "should raise an exception" do
          expect( subject.deliver DockingStation.new ).to eq []
        end
      end
    end
end

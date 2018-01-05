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
        it "should deliver all bikes to target" do
            
        end
    end
end

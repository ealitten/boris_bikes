require "docking_station"

describe DockingStation do

  let(:bike) {double :bike}

  describe "#initialize" do
    it "should set capacity if supplied as argument" do
      dock = DockingStation.new(13)
      expect(dock.capacity).to eq(13)
    end

    it "should set capacity as default if no argument" do
      expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
    end
  end

  describe "#release_bike" do
    it "should raise error if no bikes in station" do
      expect{subject.release_bike}.to raise_error("No bikes available")
    end

    it "should release bike if >0 bikes in station" do
      allow(bike).to receive(:working?).and_return true
      subject.dock_bike bike
      expect(subject.release_bike).to eq bike
    end

    it "should not release bike if not working" do
      allow(bike).to receive(:working?).and_return false        
      subject.dock_bike bike
      expect{subject.release_bike}.to raise_error("Bike not working")
    end
  end

  describe "#dock_bike" do
    it "should dock bike in station" do
      allow(bike).to receive(:working?).and_return true
      expect(subject.dock_bike(bike)).to eq(bike)
    end

    it "should raise error if station full" do
      allow(bike).to receive(:working?).and_return true
      subject.capacity.times{subject.dock_bike bike} 
      expect{subject.dock_bike bike}.to raise_error("No space in docking station")
    end

    it "should show bikes in station" do
      expect(subject.docked_bikes).to eq([]) #station starts with no bikes
    end
  end
end

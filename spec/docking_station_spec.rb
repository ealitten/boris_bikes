require "docking_station"

describe DockingStation do

  describe "#release_bike" do
    it "should raise error if no bikes in station" do
      expect{subject.release_bike}.to raise_error("No bikes")
    end

    it "should release bike if >0 bikes in station" do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.release_bike).to be_a Bike
    end
  end

  it "should dock bike in station" do
    bike = Bike.new
    expect(subject.dock_bike(bike)).to eq(bike)
  end

  it "should show bikes in station" do
    expect(subject.docked_bikes).to eq([])
  end

  
end

# In spec/docking_station_spec.rb
require "docking_station"

describe DockingStation do
  it {is_expected.to respond_to :release_bike}
  it {is_expected.to respond_to(:dock).with(1).argument}

  describe "#release_bike" do
    it "expects station to release bikes" do
      bike = Bike.new
      subject.dock bike
      bikes = subject.bike_num
      instance = subject.release_bike
      expect(instance).to eq(bikes - 1)
    end

    it "Raises an error if no bikes are available." do
      expect{subject.release_bike}.to raise_error "No bikes are available."
    end
  end

  describe "#dock" do
    it "expects to see if bike is docked" do
      bike = Bike.new
      subject.dock bike
      expect(subject.bike_num).to be >= 1
    end

    it "Raises an error if a bike is already docked." do
      bike = Bike.new
      21.times {subject.dock bike}
      expect{subject.dock(bike)}.to raise_error "Too many bikes docked."
    end
    it "Has a capacity of 20 bikes" do
      bike = Bike.new
      20.times {subject.dock bike}
      expect(subject.bike_num).to be == 20
    end
  end
end

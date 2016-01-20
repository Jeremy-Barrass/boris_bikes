# In spec/docking_station_spec.rb
require "docking_station"

describe DockingStation do
  it {is_expected.to respond_to :release_bike}
  it {is_expected.to respond_to(:dock).with(1).argument}

  describe "capacity" do
    it "Is equal to the default capacity" do
      expect(subject.capacity).to eq DockingStation::Default_capacity
    end

    it "Can be changed at initialisation" do
      cap = rand(50)
      if cap = 20
        cap = cap -1
      end
      ds = DockingStation.new(cap)
      expect(ds.capacity).not_to eq DockingStation::Default_capacity
    end
  end

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
      subject.capacity.times {subject.dock bike}
      expect{subject.dock(bike)}.to raise_error "Too many bikes docked."
    end
    it "Has a capacity of 'capacity' bikes" do
      bike = Bike.new
      subject.capacity.times {subject.dock bike}
      expect(subject.bike_num).to be subject.capacity
    end
  end
end

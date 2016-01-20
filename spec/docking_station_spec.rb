# In spec/docking_station_spec.rb
require "docking_station"

  describe DockingStation do
    it {is_expected.to respond_to :release_bike}
    it {is_expected.to respond_to(:dock).with(1).argument}

    describe "#release_bike" do
      it "expects station to release bikes" do
        bike = Bike.new
        subject.dock bike
        instance = subject.release_bike
        expect(instance).to be_instance_of Bike
      end

      it "Raises an error if no bikes are available." do

        expect{subject.release_bike}.to raise_error "No bikes are available."
      end
    end

    it "expects to see if bike is docked" do
      instance = subject.bike
      expect(instance).to eq(@bike)
    end
  end

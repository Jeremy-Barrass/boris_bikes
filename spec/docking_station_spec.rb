# In spec/docking_station_spec.rb
require "docking_station"

describe DockingStation do
  it {is_expected.to respond_to :release_bike}

  it "expects station to release bikes" do
    bike = subject.release_bike
    expect(bike).to be_working
  end
end
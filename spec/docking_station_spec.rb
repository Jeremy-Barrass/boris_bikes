# In spec/docking_station_spec.rb
require "docking_station"

describe DockingStation do
  it {is_expected.to respond_to :release_bike}
  it {is_expected.to respond_to(:dock).with(1).argument}

  it "expects station to release bikes" do
    instance = subject.release_bike
    expect(instance).to be_working

  end
  it "expects to see if bike is docked" do
    instance = subject.bike
    expect(instance).to eq(@bike)

  end


end
require "Van.rb"
require 'bike.rb'

describe Van do
let(:bike) {double :bike}
  it "It collects broken bikes from the docking station." do
    expect(subject).to respond_to(:collect_bike)
  end

  describe "#collect_bike" do
    it "Accepts broken bikes" do
      allow(bike).to receive(:broken?).and_return(true)
      expect { subject.collect_bike(bike) }.to change { subject.bikes.count }.by 1
    end

    it 'Accepts mended bikes' do
      allow(bike).to receive(:broken?).and_return(false)
      expect {subject.collect_bike(bike)}.to change {subject.bikes.count}.by 1
    end
  end

  describe'#collect_bike' do
    it 'van can only take capacity of bikes' do
      allow(bike).to receive(:broken?).and_return(true)
      subject.capacity.times { subject.collect_bike(bike) }
      expect { subject.collect_bike(bike) }.to raise_error('The van is full')
    end
  end

  describe "#deposit_broken_bike" do
    it "Deposits a broken bike" do
      allow(bike).to receive(:broken?).and_return(true)
      subject.collect_bike(bike)
      expect(subject.deposit_broken_bike).to eq bike
    end
  end

  describe '#deposit_broken_bike' do
    it 'error when no more bikes to deposit' do
      expect{ subject.deposit_broken_bike }.to raise_error('No broken bikes to drop off')
    end
  end

  describe "#initialize" do
    it "Initialize should set default capacity 10" do
    expect(subject.capacity).to eq Van::DEFAULT_CAPACITY
    end
  end
end

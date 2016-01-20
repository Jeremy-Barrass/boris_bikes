require_relative 'bike'

class DockingStation
  def initialize
    @bike_num = 0
  end

  attr_reader :bike_num

  def release_bike
    raise "No bikes are available." if @bike_num <= 0
    bike = Bike.new
    @bike_num -= 1
  end

  def dock(bike)
    raise "Too many bikes docked." if @bike_num > 20
    @bike_num += 1
  end
end

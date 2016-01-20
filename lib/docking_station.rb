require_relative 'bike'

class DockingStation
  Default_capacity = 20

  def initialize
    @bike_num = 0
  end

  attr_reader :bike_num, :Default_capacity

  def release_bike
    raise "No bikes are available." if empty?
    bike = Bike.new
    @bike_num -= 1
  end

  def dock(bike)
    raise "Too many bikes docked." if full?
    @bike_num += 1
  end

  private

  def full?
    @bike_num >= Default_capacity
  end

  def empty?
    @bike_num <= 0
  end
end

require_relative 'bike'

class DockingStation

  attr_reader :bike

  def release_bike
    raise "No bikes are available." unless @bike
    @bike
  end

  def dock(bike)
    raise "A bike is already docked." unless !@bike
    @bike = bike
  end
end

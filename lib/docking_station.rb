require_relative 'bike'

class DockingStation

  attr_reader :bike

  def initialize

  end

  def release_bike
    raise "No bikes are available." unless @bike
    @bike
  end

  def dock(bike)
    @bike = bike
  end
end

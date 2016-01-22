class Van

  attr_reader :broken_bikes, :mended_bikes,:capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @broken_bikes = []
    @mended_bikes = []
    @capacity = capacity
  end

  # def broken_bike_dup
  #   @broken_bikes.dup
  # end

  def collect_broken_bike(bike)
    raise 'This bike is not broken' if !bike.broken?
    raise 'The van is full' if @broken_bikes.count >= 10
    @broken_bikes << bike
  end

  def collect_mended_bikes(bike)
    @mended_bikes << bike
  end

  def deposit_broken_bike
    raise 'No broken bikes to drop off' if @broken_bikes.count == 0
    @broken_bikes.pop
  end

  private



end

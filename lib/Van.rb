class Van

  attr_reader :bikes, :mended_bikes,:capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  # def broken_bike_dup
  #   @broken_bikes.dup
  # end

  def collect_bike(bike)
    raise 'The van is full' if @bikes.count >= 10
    @bikes << bike
  end

  def deposit_broken_bike
    raise 'No broken bikes to drop off' if @bikes.count == 0
    @bikes.pop
  end

  private



end

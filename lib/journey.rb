class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  attr_reader :entry_station, :exit_station

  def initialize(entry_station = nil)
    @finished = false
    @entry_station = entry_station
    @exit_station = nil
  end

  def finished?
    @finished
  end

  def finish(exit_station = nil)
    @exit_station = exit_station
    @finished = true
    self
  end

  def fare
    if penalty?
      PENALTY_FARE
    else
      MINIMUM_FARE
    end
  end

  private

  def penalty?
    exit_station.nil? || entry_station.nil?
  end

end

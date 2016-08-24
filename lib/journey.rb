class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  attr_reader :details, :entry_station, :exit_station

  def initialize(entry_station)
    @complete = false
    @entry_station = entry_station
    @exit_station = nil
    @details = nil
  end

  def complete?
    @complete
  end

  def finish(exit_station)
    @exit_station = exit_station
    @complete = true
    record
  end

  def fare
    if exit_station.nil?
    PENALTY_FARE
    else
    MINIMUM_FARE
    end
  end

  def record
    @details = {entry: entry_station, exit: exit_station}
  end

end

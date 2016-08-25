class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  attr_reader :details, :entry_station, :exit_station

  def initialize(entry_station = nil)
    @finished = false
    @entry_station = entry_station
    @exit_station = nil
    @details = nil
  end

  def finished?
    @finished
  end

  def finish(exit_station)
    @exit_station = exit_station
    @finished = true
    record
  end

  def fare
    if exit_station.nil? || entry_station.nil?
      PENALTY_FARE
    else
      MINIMUM_FARE
    end 
  end

  private

  def record
    @details = {entry: entry_station, exit: exit_station}
  end

end

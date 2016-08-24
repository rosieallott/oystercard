class Journey

  attr_reader :details

  def initialize(entry_station)
    @complete = false
    @entry_station = entry_station
    @details = {entry_station => nil}
  end

  def complete?
    @complete
  end

  def finish(exit_station)
    @complete = true
    @details[@entry_station] = exit_station
  end

end

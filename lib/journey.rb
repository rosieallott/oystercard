class Journey

  attr_reader :log

  def initialize(entry_station)
    @complete = false
    @entry_station = entry_station
    @log = {entry_station => nil}
  end

  def complete?
    @complete
  end

  def finish(exit_station)
    @complete = true
    @log[@entry_station] = exit_station
  end

end

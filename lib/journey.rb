class Journey

  def initialize(entry_station)
    @complete = false
    @entry_station = entry_station
  end

  def complete?
    @complete
  end

  def finish
    @complete = true
  end

end

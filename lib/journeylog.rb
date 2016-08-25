class JourneyLog

  def initialize(journey_class = Journey)
    @journey_class = journey_class
  end

  def start(entry_station)
    @current_journey = @journey_class.new
  end





end

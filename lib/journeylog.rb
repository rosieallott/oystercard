require_relative 'journey'

class JourneyLog

attr_reader :journeys

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @journeys = []
    @current_journey = nil
  end

  def start(entry_station)
    fail "already in a journey" if !@current_journey.nil?
    @current_journey = journey_class.new(entry_station)
    add(@current_journey)
  end

  def finish(exit_station)
    @current_journey = journey_class.new if @current_journey == nil
    @current_journey.finish(exit_station)
  end

  def journeys
    @journeys.dup
  end

  private

  attr_reader :journey_class

  def add(journey)
    @journeys << journey
  end

end

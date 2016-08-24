require_relative 'journey'

class Oystercard

attr_reader :current_journey, :journeys

LIMIT = 90
BALANCE = 0
MINIMUM_BALANCE = 1

  def initialize(journey_class = Journey, balance = BALANCE)
    @balance = balance
    @journeys = []
    @journey_class = journey_class
  end

  def top_up(amount)
    fail "Limit £#{LIMIT} exceeded" if full?(amount)
    @balance += amount
  end

  def touch_in(station)
    fail 'below minimum balance' if empty?
    @current_journey = @journey_class.new(station)
  end

  def touch_out(amount, station)
    current_journey.finish(station)
    @journeys << current_journey.details
    deduct(amount)
    @current_journey = nil
  end

  private

  attr_reader :balance, :entry_station

  def deduct(amount)
    @balance -= amount
  end

  def full?(amount)
    @balance + amount > LIMIT
  end

  def empty?
    @balance < MINIMUM_BALANCE
  end

end

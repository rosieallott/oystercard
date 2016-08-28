require_relative 'journey'
require_relative 'journeylog'

class Oystercard

attr_reader :balance

LIMIT = 90
MINIMUM_BALANCE = 1

  def initialize(journey_log: JourneyLog.new)
    @balance = 0
    @journey_log = journey_log
  end

  def top_up(amount)
    fail "Limit £#{LIMIT} exceeded" if full?(amount)
    @balance += amount
  end

  def touch_in(station)
    fail 'below minimum balance' if @balance < MINIMUM_BALANCE
    journey_log.start(station)
  end

  def touch_out(station)
    journey = journey_log.finish(station)
    deduct(journey.fare)
  end

  private

  attr_reader :journey_log

  def deduct(amount)
    @balance -= amount
  end

  def full?(amount)
    (balance + amount) > LIMIT
  end

end

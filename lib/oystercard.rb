class Oystercard
attr_reader :entry_station
DEFAULT_BALANCE = 0
MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

  def initialize
    @balance = DEFAULT_BALANCE
    @max = MAXIMUM_BALANCE
    @in_journey = false
    @min = MINIMUM_BALANCE
    @entry_station = nil
  end

  def top_up(amount)
    fail "Exceed maximum balance of #{@max}" if (@balance + amount) > @max
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in(station)
    fail "Minimum balance required" if @balance < @min
    @in_journey = true
    @entry_station = station
  end

  def touch_out(fare)
    deduct(fare)
    @in_journey = false
  end

private

def deduct(fare)
  @balance -= fare
end
attr_reader :balance

  # def max?
  #   if @balance + > MAXIMUM_BALANCE
  # end

end

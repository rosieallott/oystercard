class Oystercard


DEFAULT_BALANCE = 0
MAXIMUM_BALANCE = 90

  def initialize
    @balance = DEFAULT_BALANCE
    @max = MAXIMUM_BALANCE
  end

  def top_up(amount)
    fail "Exceed maximum balance of #{@max}" if (@balance + amount) > @max
    @balance += amount
  end

  def deduct(fare)
    fail "Insufficient balance" if @balance - fare < 0
    @balance -= fare
  end

private

attr_reader :balance

  # def max?
  #   if @balance + > MAXIMUM_BALANCE
  # end

end

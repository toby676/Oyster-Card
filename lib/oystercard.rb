require_relative "journey"

class OysterCard

	MAXIMUM_BALANCE = 90
	MINIMUM_BALANCE = 1
	MINIMUM_CHARGE = 1

	attr_reader :balance, :journey

	def initialize(journey = Journey.new)
		@balance = 0
		@journey = journey
	end

  def top_up(amount)
  	fail "Maximum balance of #{MAXIMUM_BALANCE} has been reached." if (amount + @balance) > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(entry_station)
  	fail "Not enough balance" if @balance < MINIMUM_BALANCE
    @journey = Journey.new(entry_station)
  end

  def touch_out(exit_station)
    deduct(MINIMUM_CHARGE)
    @journey.finish(exit_station)
  end

  private :deduct

end

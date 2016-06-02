class OysterCard

	MAXIMUM_BALANCE = 90
	MINIMUM_BALANCE = 1
	MINIMUM_CHARGE = 1

	attr_reader :balance, :entry_station, :journey_log

	def initialize
		@balance = 0
    @entry_station = nil
    @journey_log = []
	end

  def top_up(amount)
  	fail "Maximum balance of #{MAXIMUM_BALANCE} has been reached." if (amount + @balance) > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(entry_station)
  	fail "Not enough balance" if @balance < MINIMUM_BALANCE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_CHARGE)
    @journey_log << {entry_station: @entry_station, exit_station: exit_station}
    @entry_station = nil
  end

  private :deduct

end

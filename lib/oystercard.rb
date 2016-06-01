require_relative 'station'

class Oystercard

 MAXIMUM_BALANCE = 90
 MINIMUM_BALANCE = 1
 FARE = 1
 
 attr_reader :balance, :entry_station


 def initialize
  		@balance = 0
      @journey = false
      @station = nil
  end

  def top_up(amount)
  	fail 'Maximum balance of #{maximum_balance} exceeded' if amount + balance > MAXIMUM_BALANCE
  	@balance += amount
  end

  def in_journey?
    @journey
  end

  def touch_in(station)
    fail "Insufficient funds!" if @balance < MINIMUM_BALANCE
    @journey = true
    @entry_station = station
  end

  def touch_out
    deduct(FARE)
    @journey = false
  end


private

  def deduct(amount)
    @balance -= amount
  end



end
require_relative 'station'

class Oystercard

 MAXIMUM_BALANCE = 90
 MINIMUM_BALANCE = 1
 FARE = 1

 attr_reader :balance, :entry_station, :journey_log


 def initialize
  		@balance = 0
      @journey = false
      @entry_station = nil
      @exit_station = nil
      @journey_log = []
      
  end

  def top_up(amount)
  	fail 'Maximum balance of #{maximum_balance} exceeded' if amount + balance > MAXIMUM_BALANCE
  	@balance += amount
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    fail "Insufficient funds!" if @balance < MINIMUM_BALANCE
    # @journey = true
    @entry_station = station
  end

  def touch_out(station)
    deduct(FARE)
    # @entry_station = nil
    @exit_station = station
    # @journey = false
  end

  def current_journey
    #@journey_log << 
    {@entry_station => @exit_station}
    # current_journey = {}
  end 

  def journey_log
    @journey_log << current_journey
  end 


private

  def deduct(amount)
    @balance -= amount
  end



end
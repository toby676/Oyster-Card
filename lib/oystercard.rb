require 'journey'

class Oystercard

 MAXIMUM_BALANCE = 90
 MINIMUM_BALANCE = 1

 attr_reader :journey, :balance, :journey_log


 def initialize(journey=Journey.new)
  		@balance = 0
      @journey = journey
      @journey_log = []
      
  end

  def top_up(amount)
  	fail 'Maximum balance of #{maximum_balance} exceeded' if amount + @balance > MAXIMUM_BALANCE
  	@balance += amount
  end



  def touch_in(station)
    fail "Insufficient funds!" if @balance < MINIMUM_BALANCE
    journey.start(station)
  end

  def touch_out(station)
    journey.finish(station)
    deduct
    log_journey
    @journey = Journey.new
    
  end

  def current_journey
    {journey.entry_station => @journey.exit_station}
  end 

private

attr_writer :balance

  def log_journey
    journey_log << current_journey
  end 

  def deduct
    @balance -= journey.fare 
  end

  def in_journey?
    journey.in_journey?
  end



end
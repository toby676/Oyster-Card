class Oystercard

 MAXIMUM_BALANCE = 90
 MINIMUM_BALANCE = 1
 attr_reader :balance


 def initialize
  		@balance = 0
      @journey = false
  end

  def top_up(amount)
  	fail 'Maximum balance of #{maximum_balance} exceeded' if amount + balance > MAXIMUM_BALANCE
  	@balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @journey
  end

  def touch_in
    fail "Insufficient funds!" if @balance < MINIMUM_BALANCE
    @journey = true
  end

  def touch_out
    @journey = false
  end 


end
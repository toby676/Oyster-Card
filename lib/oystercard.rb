
class Oystercard

  attr_reader :balance, :in_journey  

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    top_up_fail(value)
    @balance += value
  end

  def touch_in
    fail 'Not enough balance!' if balance < DEFAULT_MIN
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MIN_CHARGE)
  end

  def in_journey?
    in_journey
  end

  private

  DEFAULT_LIMIT = 90
  DEFAULT_MIN = 1
  MIN_CHARGE = 1

  def deduct(value)
    fail "Please input an integer" unless is_number?(value)
    @balance -= value
  end

  def top_up_fail(value)
    integer_error(value)
    fail 'Exceeded limit' if limit?(value)
  end

  def integer_error(value)
    fail "Please input an integer" unless is_number?(value)
  end

  def empty?(value)
    (@balance - value) < DEFAULT_MIN
  end

  def limit?(value)
    (@balance + value ) > DEFAULT_LIMIT
  end

  def is_number?(value)
    value.is_a? Integer
  end
end

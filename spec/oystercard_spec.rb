require 'oystercard'

describe OysterCard do

  let(:entry_station) {double(:entry_station)}
  let(:exit_station) {double(:exit_station)}

  it 'has a balance' do
  	expect(subject.balance).to eq 0
  end

  context '#top_up' do
    it 'responds to top_up method' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it 'tops up balance by requested amount' do
      expect{subject.top_up(10)}.to change{subject.balance}.by 10
    end

    it 'raises an error if you try and top up over the limit' do
    	maximum_balance = OysterCard::MAXIMUM_BALANCE
    	subject.top_up(maximum_balance)
    	expect{subject.top_up(1)}.to raise_error "Maximum balance of #{maximum_balance} has been reached."
    end
  end

  # DEDUCT IS NOW PRIVATE
  # context '#deduct' do
  #   it 'responds to deduct method' do
  #     expect(subject).to respond_to(:deduct).with(1).argument
  #   end

  #   it 'deducts balance by requested amount' do
  #     subject.top_up(10)
  #     expect{subject.deduct(2)}.to change{subject.balance}.by -2
  #   end
  # end



  context '#touch_in' do
  
    it 'raises error if not enough balance' do
    	expect{subject.touch_in(entry_station)}.to raise_error "Not enough balance"
    end

end

context 'touch out' do

    xit 'deducts the minimum fare from the balance' do
    	minimum_charge = OysterCard::MINIMUM_CHARGE
    	subject.top_up(minimum_charge)
    	expect{subject.touch_out(exit_station)}.to change{subject.balance}.by -minimum_charge
    end

    it 'accepts an exit station' do
      expect(subject).to respond_to(:touch_out).with(1).argument
    end

  end

  

  context 'journey_log' do

    it 'is initialized as an array' do
      expect(subject.journey_log).to respond_to :each
    end

    xit 'creates a journey' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journey_log).to eq [{entry_station: entry_station, exit_station: exit_station}]
    end

  end

  context 'more tests' do

    before do
      subject.top_up(90)
    end

    it 'createss a new journey when touch in' do
    subject.touch_in(entry_station)
    expect(subject.journey).to respond_to :fare
    end

    it 'charges min fare if touch out with an entry station' do
      subject.touch_in(entry_station)
      expect{subject.touch_out(exit_station)}.to change{subject.balance}.by -Journey::MINIMUM_FARE
    end

  end

end

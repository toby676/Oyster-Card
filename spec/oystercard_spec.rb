require 'oystercard'

describe Oystercard do

subject(:card) {described_class.new}
let (:station) {Station.new}


 	  it 'has an initial balance of 0' do
    expect(card.balance).to eq(0)
  	end


  describe '#top_up' do

    	it { is_expected.to respond_to(:top_up).with(1).argument }

    	it 'can top up the balance' do
      expect{card.top_up 1}.to change{card.balance}.by 1
    	end


    	it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      card.top_up(maximum_balance)
      expect{ card.top_up 1 }.to raise_error 'Maximum balance of #{maximum_balance} exceeded'
    	end

  end

  # describe '#deduct' do

  #   	it { is_expected.to respond_to(:deduct).with(1).argument }

  #   	it 'deducts a fare to pay for journey' do
  #   	expect{subject.deduct 1 }.to change{subject.balance}.by -1
  #   	end
  # end

  describe '#in_journey?' do
      it {is_expected.to respond_to(:in_journey?)}

      it 'initializes journey with false' do
        expect(card.in_journey?).to be(false)
      end

      it 'responds to touch_in with true' do
        card.top_up Oystercard::MINIMUM_BALANCE
        card.touch_in(station)
        expect(card.in_journey?).to be true
      end

      it 'responds to touch_out with false' do
      card.touch_out
      expect(card.in_journey?).to be false
      end

  end

  describe '#touch_in' do

    it {should respond_to(:touch_in).with(1).argument}

    it 'refuses a card with a balance less than minimum balance' do
      expect{card.touch_in(station)}.to raise_error ("Insufficient funds!")
    end


  end

  describe '#touch_out' do
    it 'charges your card' do
      expect{card.touch_out}.to change{card.balance}.by (-Oystercard::FARE)
    end
  end


end
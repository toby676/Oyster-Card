require 'oystercard'

describe Oystercard do

subject(:card) {described_class.new}
let (:station) {double(:station)}
let (:journey) {double(:journey, start: nil, finish: nil, fare: 1 )}


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

  describe '#touch_in' do

    it {should respond_to(:touch_in).with(1).argument}

    it 'refuses a card with a balance less than minimum balance' do
      expect{card.touch_in(station)}.to raise_error ("Insufficient funds!")
    end
    
  end

  describe '#touch_out' do

    it {should respond_to(:touch_out).with(1).argument}


    it 'charges your card' do
      card.top_up(10)
      card.touch_in(station)
      expect{card.touch_out(station)}.to change{card.balance}.by (-1)
    end

  end

  describe '#journey_log' do

    it 'records the journey log' do
    card.top_up Oystercard::MINIMUM_BALANCE
    card.touch_in(station)
    card.touch_out(station)
    expect(card.journey_log).to eq ([{station => station}])

  end 

  end 


end
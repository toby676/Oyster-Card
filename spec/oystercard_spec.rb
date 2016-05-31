require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }
  context 'responses' do
    it { is_expected.to respond_to(:top_up).with(1).argument }
  end

  context '#top_up' do
    it 'adds 10 to the card' do
      expect(card.top_up(10)).to eq 10
    end

    it 'adds 5 to the card' do
      expect(card.top_up(5)).to eq 5
    end

    it 'adds 5 to a card with 10 already' do
      card.top_up(10)
      expect(card.top_up(5)).to eq 15
    end

    it 'raises an error when a string is input' do
      expect{card.top_up("foo")}.to raise_error("Please input an integer")
    end

    it 'allows money to be added to reach limit' do
      expect{card.top_up(90)}.not_to raise_error
    end

    it 'raises an error when exceeding limit of 90' do
      card.top_up(90)
      expect{card.top_up(1)}.to raise_error("Exceeded limit")
    end
  end

  context '#in_journey?' do
    it "returns false if not in journey" do
      expect(card.in_journey?).to eq false
    end
  end

  context '#touch_in' do
    it "changes #in_journey? to true" do
      card.top_up(Oystercard::DEFAULT_MIN)
      card.touch_in
      expect(card).to be_in_journey
    end

    it 'raises error if not enough balance' do
      expect{card.touch_in}.to raise_error 'Not enough balance!'
    end

  end

  context '#touch_out' do
    it "change #in_journey? to false" do
      card.top_up(Oystercard::DEFAULT_MIN)
      card.touch_in
      card.touch_out
      expect(card).not_to be_in_journey
    end

    it 'deducts balance by minimum charge' do
      expect {card.touch_out}.to change{card.balance}.by(-Oystercard::MIN_CHARGE)
    end
  end


end

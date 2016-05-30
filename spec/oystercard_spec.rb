require 'oystercard'

describe Oystercard do
  let(:card) { described_class.new } 
  context 'responses' do
    it { is_expected.to respond_to :balance }
    it { is_expected.to respond_to :top_up }
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

  context ':balance' do
    it "has a balance of 0" do
      card = Oystercard.new
      expect(card.balance).to eq 0
    end
  end

end

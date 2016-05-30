require 'oystercard'

describe Oystercard do
  context 'responses' do
    it { is_expected.to respond_to :balance }
  end

  context 'balance' do
    it "has a balance of 0" do
      card = Oystercard.new
      expect(card.balance).to eq 0
    end
  end
end

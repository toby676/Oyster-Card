require 'oystercard'

describe OysterCard do

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
  end
end

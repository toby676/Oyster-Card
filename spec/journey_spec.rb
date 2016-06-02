require "journey"

describe Journey do

	let(:entry_station) {double(:entry_station)}
  let(:exit_station) {double(:exit_station)}

	context '#in_journey?' do
    it 'initializes with false' do
      expect(subject).not_to be_in_journey
    end

		it 'changes in_journey to true' do
      subject.finish(exit_station)
      expect(subject).not_to be_in_journey
    end

  end

	context 'entry station' do

      it 'is nil when initialized' do
        expect(subject.entry_station).to eq nil
      end

      it 'forgets entry station when you touch out' do
        subject.finish(exit_station)
        expect(subject.entry_station).to eq nil
      end

  end

end

describe Journey do
  let(:station) { double :station, zone: 1}

  it "knows if a journey is not complete" do
    expect(subject).not_to be_complete
  end

  it 'has a penalty fare by default' do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  it "returns itself when exiting a journey" do
    expect(subject.finish(station)).to eq(subject)
  end

  context 'given an entry station' do
    subject {described_class.new(entry_station: station)}

    it 'has an entry station' do
      expect(subject.entry_station).to eq station
    end

    it "returns a penalty fare if no exit station given" do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    context 'given an exit station' do
      let(:other_station) { double :other_station }

      before do
        subject.finish(other_station)
      end

      it 'calculates a fare' do
        expect(subject.fare).to eq 1
      end

      it "knows if a journey is complete" do
        expect(subject).to be_complete
      end
    end
  end
end

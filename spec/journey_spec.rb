require "journey"

describe Journey do

	let(:entry_station) {double(:entry_station)}
  let(:exit_station) {double(:exit_station)}

	context '#in_journey?' do
    it 'initializes with false' do
      expect(subject).not_to be_in_journey
    end

		it 'changes in_journey to false' do
      subject.start(entry_station)
      expect(subject).to be_in_journey
    end

		it 'changes in_journey to true' do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject).not_to be_in_journey
    end
  end

	context 'entry station' do

      it 'is nil when initialized' do
        expect(subject.entry_station).to eq nil
      end

      it 'stores the entry station' do
        subject.start(entry_station)
        expect(subject.entry_station).to eq entry_station
      end

      it 'forgets entry station when you touch out' do
        subject.start(entry_station)
        subject.finish(exit_station)
        expect(subject.entry_station).to eq nil
      end

    end

		context 'journey_log' do

	    it 'is initialized as an array' do
	      expect(subject.journey_log).to respond_to :each
	    end

	    it 'creates a journey' do
	      subject.start(entry_station)
	      subject.finish(exit_station)
	      expect(subject.journey_log).to eq [{entry_station: entry_station, exit_station: exit_station}]
	    end

	  end

end

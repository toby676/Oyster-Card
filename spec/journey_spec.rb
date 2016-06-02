require 'journey'

describe Journey do



	subject(:journey) { described_class.new }
	let(:station) { double(:station) }

	describe "#start" do
		it "records entry station" do
			journey.start(station)
			expect(journey.entry_station).to eq station
		end
	end

	describe "#finish" do
		it "records exit station" do
			journey.finish(station)
			expect(journey.exit_station).to eq station
		end
	end

	describe "#in_journey?" do
		it "knows if it's in a journey" do
			journey.start(station)
			expect(journey.in_journey?).to eq true
		end
	end

	describe "#complete"
		it "knows if journey is complete" do
			journey.start(station)
			journey.finish(station)
			expect(journey.complete?).to eq true
		end

	describe '#fare' do

	it "calculates a regular fare" do
		journey.start(station)
		journey.finish(station)
		expect(journey.fare).to eq Journey::MINIMUM_FARE
	end 

	it "charges penalty fare for incomplete journey" do
		journey.start(station)
		expect(journey.fare).to eq Journey::MAXIMUM_FARE
	end 


	end


end
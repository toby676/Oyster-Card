require 'station'

describe Station do

	let(:station) {described_class.new(:name,:zone)}

	context "Initialize" do
		it "initializes with a name" do
			expect(station.name).to eq :name
		end

		it "initializes with a zone" do
			expect(station.zone).to eq :zone
		end
	end


end

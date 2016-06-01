require 'station'

describe Station do
	
 subject(:station) { described_class.new(:name, :zone) }

	it 'should have a name at initialization' do
		expect(station.name).to eq :name
	end

	it 'should have a zone at initialization' do
		expect(station.zone).to eq :zone
	end

end
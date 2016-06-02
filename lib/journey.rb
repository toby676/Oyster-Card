class Journey

	attr_reader :entry_station, :journey_log

	def initialize(entry_station = nil)
		@entry_station = entry_station
		@journey_log = []
	end

	def in_journey?
		!!@entry_station
	end

	def finish(exit_station)
		@journey_log << {entry_station: @entry_station, exit_station: exit_station}
		@entry_station = nil
	end

end

class Journey

	PENALTY_FARE = 6
	MINIMUM_FARE = 1

	attr_reader :entry_station, :journey_log

	def initialize(entry_station = nil)
		@entry_station = entry_station
		@exit_station = nil
	end

	def in_journey?
		!!@entry_station
	end

	def finish(exit_station)
		@exit_station = exit_station
		self
	end

	def complete?
		!!@entry_station && !!@exit_station
	end

	def fare
		if complete?
			MINIMUM_FARE
		else
			PENALTY_FARE
		end
	end

end

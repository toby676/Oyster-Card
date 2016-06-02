class Journey

	attr_reader :entry_station, :exit_station

	 MINIMUM_FARE = 1
	 MAXIMUM_FARE = 6

	def start(station)
		@entry_station = station
	end

	def finish(station)
		@exit_station = station
	end

	def in_journey?
		!!entry_station && exit_station.nil?	
	end

	def complete?
		!!entry_station && !!exit_station
	end

	def fare 
		complete? ? MINIMUM_FARE : MAXIMUM_FARE
	end 



end
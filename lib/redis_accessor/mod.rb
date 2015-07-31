module RedisAccessor
	class Mod
		def initialize(hash)
			@info = hash
		end

		def units_as_hashes
			@info["UNITS"]
		end

		# TODO: Return an array of unit object models
		def units_as_models
		end

		def to_s
			@info.to_s
		end
	end
end
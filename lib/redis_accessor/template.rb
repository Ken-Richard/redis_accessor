module RedisAccessor
	class Template
		def initialize(hash)
			@info = hash
		end

		def modules_as_hashes
			@info["MODULES"]
		end

		# TODO: Return an array of module object models
		def modules_as_models
		end

		def to_s
			@info.to_s
		end
	end
end
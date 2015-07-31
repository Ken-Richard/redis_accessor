module RedisAccessor
	class Unit
		def initialize(hash)
			@info = hash
		end

		def get_lessons
			@info["LESSONS"]
		end

		def get_objectives(lesson)
			lesson.downcase!
			objectives = @info["OBJECTIVES"][lesson]
			if objectives.is_a? String
				[objectives]
			else
				objectives
			end
		end

		def to_s
			@info.to_s
		end
	end
end
module RedisAccessor
	class Mod
		def initialize(hash, questions)
			@info = hash
			@questions = questions
		end

		def units_as_hashes
			@info["UNITS"]
		end

		# TODO: Return an array of unit object models
		def units_as_models
		end

		# Returns an array of question Hashes
		def get_test_questions
			test_questions = []
			@questions.each do |question|
				test_questions << question.values[0] if question.values[0]["Purpose"] == "Test"
			end
			test_questions
		end

		def to_s
			@info.to_s
		end
	end
end
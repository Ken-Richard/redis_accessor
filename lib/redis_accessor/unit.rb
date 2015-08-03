module RedisAccessor
	class Unit
		def initialize(hash, questions, unit_id)
			@info = hash
			@questions = questions
			@unit_id = unit_id
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

		def get_quiz_questions
			test_questions = []
			@questions.each do |question|
				test_questions << question.values[0] if question.values[0]["Purpose"] == "Quiz" && question.keys[0] == @unit_id
			end
			test_questions
		end

		def to_s
			@info.to_s
		end
	end
end
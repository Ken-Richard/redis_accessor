require 'redis_accessor/spec_helper'

describe RedisAccessor::Unit do
	before do
		@unit = $access.get_unit("maadmisco01", "maadmisco")
	end

	it "gets an array of lessons" do
		lessons = @unit.get_lessons
		expect(lessons.class).to eq(Array)
		expect(lessons.count).to eq(2)
	end

	it "gets an array of objectives" do
		expect(@unit.get_objectives("introduction").class).to eq(Array)
	end

	it "gets an array of quiz question hashes" do
		questions = @unit.get_quiz_questions
		expect(questions.count).to eq(11)
		expect(questions[0]["Purpose"]).to eq("Quiz")
	end

	it "to_s returns a hash" do
		expect(@mod.to_s.class).to eq(String)
	end
end
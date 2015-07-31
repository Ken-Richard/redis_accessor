require 'redis_accessor/spec_helper'

describe RedisAccessor::Unit do
	before do
		@unit = $access.get_unit("maadmisco01", "maadmisco")
	end

	it "returns an array of lessons" do
		lessons = @unit.get_lessons
		expect(lessons.class).to eq(Array)
		expect(lessons.count).to eq(2)
	end

	it "returns a list of objectives" do
		expect(@unit.get_objectives("introduction").class).to eq(Array)
	end

	it "to_s returns a hash" do
		expect(@mod.to_s.class).to eq(String)
	end
end
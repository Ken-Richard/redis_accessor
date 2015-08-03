require 'redis_accessor/spec_helper'

describe RedisAccessor::Mod do
	before do
		@mod = $access.get_module("MAADMISCO")
	end

	it "to_s returns a hash" do
		expect(@mod.to_s.class).to eq(String)
	end

	it "gets array of unit hashes" do
		units = @mod.units_as_hashes
		expect(units.class).to eq(Array)
		expect(units[0].class).to eq(Hash)
		expect(units.count).to eq(4)
	end

	it "gets array of test question hashes" do
		test_questions = @mod.get_test_questions
		expect(test_questions.size).to eq(20)
		expect(test_questions[0]["Purpose"]).to eq("Test")
	end
end
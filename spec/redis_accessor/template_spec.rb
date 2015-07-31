require 'redis_accessor/spec_helper'

describe RedisAccessor::Template do
	before do
		@template = $access.get_template("BF")
	end

	it "to_s returns a hash" do
		expect(@template.to_s.class).to eq(String)
	end

	it "gets array of module hashes" do
		expect(@template.modules_as_hashes.class).to eq(Array)
		expect(@template.modules_as_hashes[0].class).to eq(Hash)
		expect(@template.modules_as_hashes.count).to eq(13)
	end
end
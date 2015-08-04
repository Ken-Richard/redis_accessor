require 'redis_accessor/spec_helper'

describe RedisAccessor::Accessor do
  it "returns Template object" do
    expect($access.get_template("BF").class).to eq(RedisAccessor::Template)
  end

  it "returns Mod object" do
    expect($access.get_module("MAadMISCO").class).to eq(RedisAccessor::Mod)
  end

  it "returns Unit object" do
    expect($access.get_unit("maadmisco01", "maadmisco").class).to eq(RedisAccessor::Unit)
  end

  it "raises an exception if the redis hash doesn't exist" do
  	exception = false

  	begin
  		$access.get_module("fake")
  	rescue Exception
  		exception = true
  	end

  	expect(exception).to be_truthy
  end
end
require 'redis_accessor/spec_helper'

describe RedisAccessor::Template do
  before do
    @template = $access.get_template("CA")
  end

  it "to_h returns a hash" do
    expect(@template.to_h.class).to eq(Hash)
  end

  it "gets array of module model objects" do
    modules = @template.get_modules
    
    expect(modules.class).to eq(Array)
    expect(modules[0].class).to eq(RedisAccessor::Mod)
    expect(modules.size).to eq(13)
  end
end
require 'redis_accessor/spec_helper'

describe RedisAccessor::Mod do
  before do
    @mod = $access.get_module("bclaw")
  end

  it "to_h returns a hash" do
    expect(@mod.to_h.class).to eq(Hash)
  end

  it "gets array of unit object models" do
    units = @mod.get_units

    expect(units.class).to eq(Array)
    expect(units[0].class).to eq(RedisAccessor::Unit)
    expect(units.size).to eq(3)
  end

  it "gets array of test question hashes" do
    test_questions = @mod.get_test_questions

    expect(test_questions.size).to eq(24)
    expect(test_questions[0]["Purpose"]).to eq("Test")
  end

  it "gets array of teacher resources" do
    new_mod = $access.get_module("maadmisco")

    resources = new_mod.get_teacher_resources

    expect(resources.size).to eq(1)
    expect(resources.class).to eq(Array)
    expect(resources[0].class).to eq(RedisAccessor::TeacherResources)
  end

  it "returns nil if there are no teacher resources" do
    resources = @mod.get_teacher_resources

    expect(resources).to eq(nil)
  end
end
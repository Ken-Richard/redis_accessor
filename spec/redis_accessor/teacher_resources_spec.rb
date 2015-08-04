require 'redis_accessor/spec_helper'

describe RedisAccessor::TeacherResources do
  before do
    unit = $access.get_unit("bclawlaw", "bclaw")
    @resource = unit.get_teacher_resources[0]
  end

  it "has a group" do
    expect(@resource.group).to eq("a. Teacher Guide")
  end

  it "has a title" do
    expect(@resource.title).to eq("Lesson Plans")
  end

  it "has a path with resolved variable"
  it "can open the path"
end
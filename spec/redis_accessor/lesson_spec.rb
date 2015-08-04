require 'redis_accessor/spec_helper'

describe RedisAccessor::Lesson do
  before do
    unit = $access.get_unit("bclawlaw", "bclaw")
    @lesson = unit.get_lessons[0]
  end

  it "to_s returns the lesson id" do
    expect(@lesson.to_s).to eq("Lesson Id: Contracts")
  end 

  it "gets an array of objectives" do
    objectives = @lesson.get_objectives
    
    expect(objectives.class).to eq(Array)
    expect(objectives.count).to eq(1)
    expect(objectives).to eq(["Define contracts and describe types of contracts"])
  end
end
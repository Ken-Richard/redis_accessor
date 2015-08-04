require 'redis_accessor/spec_helper'

describe RedisAccessor::Unit do
  before do
    @unit = $access.get_unit("bclawlaw", "bclaw")
  end

  it "gets an array of quiz question hashes" do
    questions = @unit.get_quiz_questions

    expect(questions.count).to eq(20)
    expect(questions[0]["Purpose"]).to eq("Quiz")
  end

  it "to_h returns a hash" do
    expect(@unit.to_h.class).to eq(Hash)
  end

  it "gets an array of lessons" do
    lessons = @unit.get_lessons

    expect(lessons.class).to eq(Array)
    expect(lessons.count).to eq(3)
  end

  it "gets an array of teacher resources" do
    resources = @unit.get_teacher_resources

    expect(resources.size).to eq(10)
    expect(resources.class).to eq(Array)
    expect(resources[0].class).to eq(RedisAccessor::TeacherResources)
  end
end
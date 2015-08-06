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

  it "has a lesson url with a resolved variable" do
    expect(@lesson.lesson_path).to eq("V:\\BNIT Curriculum\\BI\\BC Business Law\\BC LAW 2-Business Law\\SCORM\\Contracts - Storyline output")
  end

  it "generates a S3 url for the lesson" do
    expect(@lesson.open_lesson(false)).to eq("https://s3.amazonaws.com/colin-testing/units/BCLawLaw/1/media/Contracts+-+Storyline+output/story.html")
  end
end
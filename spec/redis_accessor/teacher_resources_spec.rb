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

  it "has a resource path with resolved variable" do
    expect(@resource.path).to eq("I:\\_BC21 Online Resources\\BCLAW-Business Law\\BCLawLaw-Business Law\\BC LAW 3_Business Law.pdf")
  end

  it "generates S3 url for the resource" do
    expect(@resource.open_resource(false)).to eq("https://s3.amazonaws.com/colin-testing/units/BCLawLaw/1/manuals/BC+LAW+3_Business+Law.pdf")
  end

end
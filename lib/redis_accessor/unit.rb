require_relative 'lesson'
require_relative 'teacher_resources'

module RedisAccessor
  class Unit
    def initialize(params)
      @info = params[:info]
      @questions = params[:questions]
      @unit_id = params[:unit_id]
      @redis = params[:redis]
      @module_id = params[:module_id]
      @version = params[:version]
    end

    def get_lessons
      lesson_models = []
      lessons = @info["LESSONS"]
      lessons.each_with_index do |lesson, index|
        params = {
          lesson_info: lesson,
          objectives: @info["OBJECTIVES"],
          unit_id: @unit_id,
          redis: @redis,
          lesson_number: index,
          module_id: @module_id
        }
        lesson_models << Lesson.new(params)
      end
      lesson_models
    end

    def get_quiz_questions
      test_questions = []
      @questions.each do |question|
        test_questions << question.values[0] if is_quiz?(question)
      end
      test_questions
    end

    def get_teacher_resources
      resources = []
      return nil if !@info["RESOURCES"]
      @info["RESOURCES"].each do |resource|
        resources << TeacherResources.new(resource, resource_params)
      end
      
      resources
    end

    def to_h
      @info
    end

  private
    def is_quiz?(question)
      question.values[0]["Purpose"] == "Quiz" && question.keys[0] == @unit_id
    end

    def resource_params
      {
        type: "unit",
        type_id: @info["KEY"],
        version: @version
      }
    end
  end
end
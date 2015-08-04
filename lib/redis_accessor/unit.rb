require_relative 'lesson'
require_relative 'teacher_resources'

module RedisAccessor
  class Unit
    def initialize(hash, questions, unit_id, accessor)
      @info = hash
      @questions = questions
      @unit_id = unit_id
      @accessor = accessor
    end

    def get_lessons
      lesson_models = []
      lessons = @info["LESSONS"]
      lessons = [lessons] if lessons.is_a? String
      lessons.each do |lesson|
        lesson_models << Lesson.new(lesson, @info["OBJECTIVES"])
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
      if @info["RESOURCES"].is_a? Array
        @info["RESOURCES"].each do |resource|
          resources << TeacherResources.new(resource)
        end
      else
        resources << TeacherResources.new(@info["RESOURCES"])
      end
      resources
    end

    def to_h
      @info
    end

    def is_quiz?(question)
      question.values[0]["Purpose"] == "Quiz" && question.keys[0] == @unit_id
    end

    private :is_quiz?
  end
end
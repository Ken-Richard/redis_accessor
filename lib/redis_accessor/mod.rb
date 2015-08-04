require_relative 'teacher_resources'

module RedisAccessor
  class Mod
    def initialize(hash, questions, module_id, accessor)
      @info = hash
      @questions = questions
      @module_id = module_id
      @accessor = accessor
    end

    def get_units
      units = []
      @info["UNITS"].each do |unit|
        unit_id = unit["Unit Key"].downcase
        units << @accessor.get_unit(unit_id, @module_id)
      end
      units
    end

    def get_test_questions
      test_questions = []
      @questions.each do |question|
        test_questions << question.values[0] if is_test?(question)
      end
      test_questions
    end

    def get_teacher_resources
      resources = []
      return nil if !@info["RESOURCES"]
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
      @info.to_h
    end

    def is_test?(question)
      question.values[0]["Purpose"] == "Test"
    end

    private :is_test?
  end
end
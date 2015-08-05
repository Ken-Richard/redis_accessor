require_relative 'teacher_resources'

module RedisAccessor
  class Mod
    def initialize(params)
      @info = params[:info]
      @questions = params[:questions]
      @module_id = params[:module_id]
      @accessor = params[:accessor]
      @version = params[:version]
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
      
      @info["RESOURCES"].each do |resource|
        resources << TeacherResources.new(resource, resource_params)
      end

      resources
    end

    def to_h
      @info.to_h
    end

  private
    def is_test?(question)
      question.values[0]["Purpose"] == "Test"
    end

    def resource_params
      {
        type: "module",
        type_id: @info["KEY"],
        version: @version
      }
    end
  end
end
module RedisAccessor
  class Lesson
    def initialize(lesson_id, objectives)
      @lesson_id = lesson_id
      @objectives = objectives
    end
    
    def get_objectives
      downcase_id = @lesson_id.downcase
      if @objectives[downcase_id].is_a? String
        [@objectives[downcase_id]]
      else
        @objectives[downcase_id]
      end
    end

    def to_s
      "Lesson Id: #{@lesson_id}"
    end
  end
end
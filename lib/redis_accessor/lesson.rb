require 'launchy'

module RedisAccessor
  class Lesson
    attr_reader :lesson_path

    def initialize(params)
      @lesson_id = params[:lesson_info][0]
      @lesson_path = params[:lesson_info][1]
      @objectives = params[:objectives]
      @unit_id = params[:unit_id]
      @redis = params[:redis]
      @lesson_number = params[:lesson_number]
      @module_id = params[:module_id]
    end
    
    def get_objectives
      downcase_id = @lesson_id.downcase
      if @objectives[downcase_id].is_a? String
        [@objectives[downcase_id]]
      else
        @objectives[downcase_id]
      end
    end

    def open_lesson
      lesson_path_name = get_path_name
      lesson_url = get_story_url(lesson_path_name) 
      Launchy.open(lesson_url)
    end

    def to_s
      "Lesson Id: #{@lesson_id}"
    end

  private
    def get_path_name
      @lesson_path.split("\\").last.strip
    end

    def get_story_url(lesson)
      url_root = "https://s3.amazonaws.com/colin-testing"
      latest_version = @redis.llen("aes:module:#{@module_id}:versions")
      lesson_words = lesson.split(" ")
      story_bucket_keys = @redis.lrange("aes:bucket_keys:#{@module_id}:#{latest_version}", "0", "-1")
      story_bucket_keys.each do |key|
        lesson_word = key.split("/")
        lesson_word = lesson_word[lesson_word.count - 2]
        if correct_lesson?(lesson_word, lesson_words) || key.include?("U_#{@unit_id}_L#{@lesson_number}")
          key.include?("U_#{@unit_id}_L#{@lesson_number}") ? url = "#{url_root}/#{key}" : url = "#{url_root}/#{key.gsub!(" ", "+")}"
          return url
        end
      end
      return false
    end

    def correct_lesson?(s3_lesson_words, lesson_words)
      words_not_found = []
      found_count = 0
      lesson_words.each do |word|
        if word.strip == "U.S."
          word = "US"
        end
        s3_lesson_words.include?(word) ? found_count += 1 : words_not_found << word
      end
      words_not_found.each do |word|
        # Takes care of plural declarations
        if word[-1, 1] == "s"
          found_count += 1 if s3_lesson_words.include?(word.chop!)
        end
      end
      found_count == lesson_words.count ? true : false
    end
  end
end
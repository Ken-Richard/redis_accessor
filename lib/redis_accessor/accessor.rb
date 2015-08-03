require 'rubygems'
require 'redis'
require 'json'

require_relative 'template'
require_relative 'mod'
require_relative 'unit'

module RedisAccessor
	class Accessor
		def initialize(redis)
			@redis = redis
		end

		def get_template(template_id)
			template_id.downcase!
			hash = JSON.parse(@redis.hget("aes:staging:templates", template_id))
			Template.new(hash)
		end

		def get_module(module_id)
			module_id.downcase!
			version = get_version(module_id)
			hash = JSON.parse(@redis.hget("aes:module:#{module_id}:#{version}", module_id))
			questions = get_questions(module_id, version)
			Mod.new(hash, questions)
		end

		def get_unit(unit_id, module_id)
			unit_id.downcase!
			module_id.downcase!
			version = get_version(module_id)
			hash = JSON.parse(@redis.hget("aes:unit:#{module_id}:#{version}", "#{unit_id}"))
			questions = get_questions(module_id, version)
			Unit.new(hash, questions, unit_id)
		end

		def get_version(module_id)
			@redis.llen("aes:module:#{module_id}:versions")
		end

		# Returns array of [unit_id => question hash]
		def get_questions(module_id, version)
			formatted_questions = []
			questions = @redis.lrange("aes:unit:#{module_id}:#{version}:questions", "0", "-1")
			questions.each do |question_string|
				formatted_questions << JSON.parse(question_string)
			end
			formatted_questions
		end

		private :get_version, :get_questions
	end
end
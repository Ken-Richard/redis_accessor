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
			Mod.new(hash)
		end

		def get_unit(unit_id, module_id)
			unit_id.downcase!
			module_id.downcase!
			version = get_version(module_id)
			hash = JSON.parse(@redis.hget("aes:unit:#{module_id}:#{version}", "#{unit_id}"))
			Unit.new(hash)
		end

		# TODO - questions arent in Redis
		def get_test_questions(module_id)
			module_id.downcase!
			version = get_version(module_id)
			@redis.llen("aes:#{module_id}:#{version}:questions")
		end

		def get_version(module_id)
			@redis.llen("aes:module:#{module_id}:versions")
		end

		private :get_version
	end
end
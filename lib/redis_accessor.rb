require 'rubygems'
require 'redis'
require 'json'

class RedisAccessor
	def initialize(redis)
		@redis = redis
	end

	def get_template(template_id)
		template_id.downcase!
		JSON.parse(@redis.hget("aes:staging:templates", template_id))
	end

	def get_module(module_id)
		module_id.downcase!
		version = get_version(module_id)
		JSON.parse(@redis.hget("aes:module:#{module_id}:#{version}", module_id))
	end

	def get_unit(unit_id, module_id)
		unit_id.downcase!
		module_id.downcase!
		version = get_version(module_id)
		JSON.parse(@redis.hget("aes:unit:#{module_id}:#{version}", "#{unit_id}"))
	end

	def get_version(module_id)
		@redis.llen("aes:module:#{module_id}:versions")
	end
end
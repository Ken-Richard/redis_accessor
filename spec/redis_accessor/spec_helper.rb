require "simplecov"
SimpleCov.start

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'redis_accessor/accessor.rb'

if !$access
	redis = Redis.new
	$access = RedisAccessor::Accessor.new(redis)
end
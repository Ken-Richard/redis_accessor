# NOTE: This assumes the module id being used in the test is already built and in the Redis database being used

require "simplecov"
SimpleCov.start

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'redis_accessor/accessor.rb'

# MODULE_ID = "maadmisco"
if !$access
  redis = Redis.new
  $access = RedisAccessor::Accessor.new(redis)
end
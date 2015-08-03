require 'rubygems'
require 'redis'
require_relative '../lib/redis_accessor/accessor'

redis = Redis.new
access = RedisAccessor::Accessor.new(redis)
# puts access.get_template("BF")
# puts access.get_module("MAadMISCO").get_test_questions
puts access.get_unit("maadmisco01", "maadmisco").get_quiz_questions
require 'rubygems'
require 'redis'
require_relative '../lib/redis_accessor'

redis = Redis.new
access = RedisAccessor.new(redis)
#puts access.get_template("BF")
#puts access.get_module("MAadMISCO")
#puts access.get_unit("maadmisco01", "maadmisco")
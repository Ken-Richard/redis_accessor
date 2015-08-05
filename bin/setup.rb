require 'rubygems'
require 'redis'
require_relative '../lib/redis_accessor/accessor'

redis = Redis.new
access = RedisAccessor::Accessor.new(redis)

template = access.get_template("CA")
mod = access.get_module("maadmisco")
unit = mod.get_units[0]
lesson = unit.get_lessons[0]
mod.get_teacher_resources[0].open_resource



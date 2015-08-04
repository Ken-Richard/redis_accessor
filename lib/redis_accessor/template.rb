require_relative 'accessor'

module RedisAccessor
  class Template
    def initialize(hash, accessor)
      @info = hash
      @accessor = accessor
    end

    def get_modules
      modules = []
      @info["MODULES"].each do |mod|
          module_id = mod["Module Key"].downcase
          modules << @accessor.get_module(module_id)
      end
      modules
    end

    def to_h
      @info
    end
  end
end
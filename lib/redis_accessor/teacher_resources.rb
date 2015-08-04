module RedisAccessor
  class TeacherResources
    attr_reader :group, :title, :path
    
    def initialize(resource)
    	if resource.include?("~")
      	@group, @title, @path = resource.split("~")
      else
      	@group, @title, @path = resource.split(",")
      end
      @group.strip!
      @title.strip!
      @path.strip!
    end
  end
end
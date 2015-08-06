require 'launchy'

module RedisAccessor
  class TeacherResources
    attr_reader :group, :title, :path
    
    def initialize(resource, params)
    	if resource[0].include?("~")
      	@group, @title, @path = resource[0].split("~")
      else
      	@group, @title, @path = resource[0].split(",")
      end
      @path = resource[1] if @path.strip != "NONE"
     
      @path.strip!
      @group.strip!
      @title.strip!

      @type = params[:type]
      @type_id = params[:type_id]
      @version = params[:version]
    end

    def open_resource(launch = true)
      resource_url = get_resource_url(get_file(@path))
      Launchy.open(resource_url) if launch
      resource_url
    end

  private
    def get_resource_url(file)
      root = "https://s3.amazonaws.com/colin-testing"
      formatted_file = file.gsub(" ", "+")
      url = root + "/#{@type}s/#{@type_id}/#{@version}/manuals/#{formatted_file}"
      url
    end

    def get_file(path)
      path.split("\\").last.strip
    end
  end
end
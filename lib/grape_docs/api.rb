module GrapeDocs
  class Api
    attr_reader :title, :detail, :path, :url, :endpoints, :children

    def initialize(grape)
      desc = grape.inheritable_setting.namespace[:description]
      @title = desc ? desc[:description] : grape.name.titlecase
      @detail = desc ? desc[:detail] : nil
      @path = File.join(grape.inheritable_setting.namespace_stackable[:mount_path])
      @url = File.join(GrapeDocs.config[:api_host], @path)
      @endpoints = []
      @children = []
      grape.endpoints.each do |endpoint|
        if endpoint.options.key?(:app)
          @children.push(Api.new(endpoint.options[:app]))
        elsif endpoint.routes.count > 0
          @endpoints.push(Endpoint.new(self, endpoint))
        end
      end
    end
  end
end

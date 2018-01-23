module GrapeDocs
  class Endpoint
    attr_reader :title, :detail, :path, :url, :params, :method, :model, :response

    def initialize(api, endpoint)
      options = endpoint.options[:route_options]
      @title = options[:description] || endpoint.options[:path].first
      @detail = options[:detail]
      parent_path = File.join(endpoint.inheritable_setting.namespace_stackable[:mount_path])
      @path = File.join(parent_path, endpoint.options[:path].first.to_s)
      @url = File.join(GrapeDocs.config[:api_host], @path)
      @params = options[:params].map { |p| p[1].merge(name: p[0]) }
      @method = endpoint.options[:method].first
      if options[:entity]
        @model = options[:entity].documentation.map { |p| p[1].merge(name: p[0]) }
        @response = build_response(@model)
      end
    end

    private

    def build_response(fields)
      result = {}
      fields.each do |field|
        result[field[:name]] = field[:example]
      end
      result
    end
  end
end

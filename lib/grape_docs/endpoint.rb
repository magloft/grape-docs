module GrapeDocs
  class Endpoint
    attr_reader :title, :detail, :path, :url, :host, :params, :status_code, :method, :model, :response

    def initialize(api, endpoint)
      options = endpoint.options[:route_options]
      @title = options[:description] || endpoint.options[:path].first
      @detail = options[:detail]
      parent_path = File.join(endpoint.inheritable_setting.namespace_stackable[:mount_path])
      @path = File.join(parent_path, endpoint.options[:path].first.to_s)
      @host = GrapeDocs.config[:api_host]
      @url = File.join(@host, @path)
      @params = options[:params].map { |p| p[1].merge(name: p[0]) }
      @method = endpoint.options[:method].first
      @status_code = 200
      if options[:entity]
        entity = options[:entity].kind_of?(Array) ? options[:entity][1] : options[:entity]
        @status_code = options[:entity].kind_of?(Array) ? options[:entity][0] : 200
        unless entity.nil?
          @model = entity.documentation.map { |p| p[1].merge(name: p[0]) }
          @response = build_response(@model)
        end
      end
    end

    def path_params
      names = path.scan(/:([a-z0-9_]+)/).map(&:first)
      params.select do |param|
        names.include?(param[:name])
      end
    end

    def body_params
      return [] if method == "GET"
      names = path.scan(/:([a-z0-9_]+)/).map(&:first)
      params.reject do |param|
        names.include?(param[:name])
      end
    end

    def query_params
      return [] if method != "GET"
      names = path.scan(/:([a-z0-9_]+)/).map(&:first)
      params.reject do |param|
        names.include?(param[:name])
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

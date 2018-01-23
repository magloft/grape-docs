require "erb"
require "json"
require "workspace"
require "active_support/inflector"
require "grape_docs/api"
require "grape_docs/endpoint"

module GrapeDocs
  @@config = { api_host: "https://api.example.com", template: "default" }
  def self.config
    @@config
  end
end

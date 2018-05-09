require 'thor'
require 'grape_docs'
require 'grape_docs/version'
require 'grape_docs/exporter'

module GrapeDocs
  class Command < Thor
    map %w[--version -v] => :__print_version
    desc "--version, -v", "print version number"
    def __print_version
      puts GrapeDocs::VERSION
    end
    desc "export <api_name> <export_path>", "Export documentation of API named <api_name> to <export_path> directory"
    method_option :host, aliases: "-h", desc: "API Host", type: :string, default: "https://api.example.com/"
    method_option :template, aliases: "-t", desc: "Markdown template (default, gitbook) or custom (requires .md.erb extension)", type: :string, default: "default"
    method_option :require, aliases: "-r", desc: "Ruby environment require path", type: :string, default: "config/environment.rb"
    def export(api_name, export_path)
      # grape docs configuration
      GrapeDocs.config[:api_host] = options.host
      GrapeDocs.config[:template] = options.template

      # prepare grape API
      require_file = Workspace.file(options.require)
      raise(Thor::Error, "ERROR: config/environment.rb doesn't exists!") unless require_file.exists?
      require require_file.to_s
      raise(Thor::Error, "ERROR: class #{api_name} isn't defined!") unless defined?(api_name)
      api = Api.new(api_name.constantize)

      # export grape API
      exporter = Exporter.new(export_path)
      exporter.export_summary(api)
      exporter.export_readme(api)
      exporter.export(api)
    end

    def self.banner(command, namespace = nil, subcommand = false)
      result = "#{basename} #{command.usage}"
      if namespace != false and command.name == "export"
        result += "\n\nArguments:\n"
        result += "  <api_name>                 # Constant name of your Grape API, e.g. MyApp::Api\n"
        result += "  <export_path>              # Directory / path where the markdown documentation will be generated in\n"
      end
      result
    end
  end
end

module GrapeDocs
  class Exporter
    attr_reader :root, :template, :api

    def initialize(export_path)
      @root = Workspace.dir(File.expand_path(export_path))

      # load template
      filename = "#{GrapeDocs.config[:template]}.md.erb"
      @template = load_template(filename)
    end

    def export_summary(api)
      summary_template = load_template("generic/SUMMARY.md.erb")
      result = summary_template.result(binding).gsub(/\n\n\n/, "\n\n")
      root.file("SUMMARY.md").write(result)
    end

    def export_readme(api)
      readme_template = load_template("generic/README.md.erb")
      result = readme_template.result(binding).gsub(/\n\n\n/, "\n\n")
      root.file("README.md").write(result)
    end

    def export(api)
      @api = api
      result = template.result(binding).gsub(/\n\n\n/, "\n\n")
      root.file("#{api.path}.md").write(result)
      api.children.each do |child|
        export(child)
      end
    end

    def table(params, *fields, &block)
      params.each do |param|
        yield param if block_given?
      end
      rows = []
      rows.push(fields.map { |f| f.to_s.titlecase })
      params.each do |param|
        rows.push(fields.map { |f| param[f]&.to_s || "-" })
      end
      seperator = []
      fields.each_with_index do |field, index|
        field_max = rows.map { |row| row[index] }.max_by(&:length).length
        seperator.push(":#{'-' * (field_max - 1)}")
        rows.each_with_index do |row, i|
          rows[i][index] = rows[i][index] + " " * (field_max - rows[i][index].length)
        end
      end
      rows.insert(1, seperator)
      rows.map { |row| "| #{row.join(' | ')} |" }.join("\n")
    end

    def json(data)
      "```json\n#{JSON.pretty_generate(data)}\n```\n"
    end

    def document_url(target)
      path = target.path.sub(%r{^/}, '')
      "#{path}.md"
    end

    private

    def load_template(filename, default_filename = "default.md.erb")
      current_dir = Workspace.dir(Dir.pwd)
      template_file = current_dir.file(filename)
      unless template_file.exists?
        spec = Gem::Specification.find_by_name("grape-docs")
        assets_dir = Workspace::Dir.new(spec.gem_dir).dir("assets")
        template_file = assets_dir.file(filename)
        unless template_file.exists?
          template_file = assets_dir.file(default_filename)
        end
      end
      ERB.new(template_file.read, nil, "%")
    end
  end
end

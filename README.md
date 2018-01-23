# grape-docs

> Automatically generate markdown documentation from your grape API

## Description

grape-docs automagically generates documentation for your Grape API in various formats.

The Gem will automatically analyze your Grape API structure, mounts, namespaces and routes, and will build a markdown documentation in separate files.

It's best used combined with [GitBook](https://www.gitbook.com) and [gitbook-plugin-api](https://github.com/MagLoft/gitbook-plugin-api) to transform your markdown documentation into a good-looking and browsable API navigation.

## Installation

Install globally using `gem install grape-docs` or include it in your project Gemfile:

```ruby
source 'http://rubygems.org'

gem 'grape-docs'
```

## Usage

Run the `grape-docs export` command to export your documentation from within your Grape API project directory:

```
Usage:
  grape-docs export <api_name> <export_path>

Arguments:
  <api_name>                 # Constant name of your Grape API, e.g. MyApp::Api
  <export_path>              # Directory / path where the markdown documentation will be generated in

Options:
  -h, [--host=HOST]          # API Host
                             # Default: https://api.example.com/
  -t, [--template=TEMPLATE]  # Markdown template (default, gitbook) or custom (requires .md.erb extension)
                             # Default: default
  -r, [--require=REQUIRE]    # Ruby environment require path
                             # Default: config/environment.rb

Export documentation of API named <api_name> to <export_path> directory
```

## Result
![grape-docs-gitbook](https://cdn.magloft.com/marketing/gems/grape-docs/default.png)
(The above result was generated using the `default` template)

![grape-docs-gitbook](https://cdn.magloft.com/marketing/gems/grape-docs/gitbook.png)
(The above result was generated using the `gitbook` template)

## License

grape-docs is available under an MIT-style license.

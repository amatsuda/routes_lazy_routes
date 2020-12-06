# frozen_string_literal: true

require_relative "lib/routes_lazy_routes/version"

Gem::Specification.new do |spec|
  spec.name          = "routes_lazy_routes"
  spec.version       = RoutesLazyRoutes::VERSION
  spec.authors       = ["Akira Matsuda"]
  spec.email         = ["ronnie@dio.jp"]

  spec.summary       = 'A Rails routes lazy loader'
  spec.description   = 'A Rails plugin that defers loading the whole bloody routes so the app can spin up quickly'
  spec.homepage      = 'https://github.com/amatsuda/routes_lazy_routes'
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = 'https://github.com/amatsuda/routes_lazy_routes'
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails'
end

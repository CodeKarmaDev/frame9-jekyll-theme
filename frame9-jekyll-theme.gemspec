# frozen_string_literal: true

require_relative "lib/frame9_jekyll_theme/version"

Gem::Specification.new do |spec|
  spec.name          = "frame9-jekyll-theme"
  spec.version       = Frame9JekyllTheme::VERSION
  spec.authors       = ["opsaaaaa"]
  spec.email         = ["sean@codekarma.dev"]

  spec.summary       = "A simple multipurpose gallary focused jekyll template"
  spec.description   = "Frame9's core feature is a 9 pane gallary."
  spec.homepage      = "https://github.com/CodeKarmaDev/frame9-jekyll-theme"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.files         = `git ls-files -z`.split("\x0").select do |f| 
    f.match(%r!^(package.json|assets|_layouts|_includes|_sass|LICENSE|_config\.yml|README)!i)
  end

  # spec.bindir        = "exe"
  # spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  # spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1", '>= 2.1.4'
  spec.add_development_dependency "webrick", "~> 1.6", '>= 1.6.1'

  # spec.add_runtime_dependency "jekyll-sitemap", ">= 1.4.0"
  spec.add_runtime_dependency "jekyll-seo-tag", '~> 2.7', '>= 2.7.0'
  spec.add_runtime_dependency "jekyll", "~> 4.1"  
  spec.add_runtime_dependency "jekyll-feed", "~> 0.12"

  # guide at: https://bundler.io/guides/creating_gem.html
end

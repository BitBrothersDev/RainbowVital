require_relative "lib/rainbow_vital/version"

Gem::Specification.new do |spec|
  spec.name        = "rainbow_vital"
  spec.version     = RainbowVital::VERSION
  spec.authors     = ["Orest Kostiuk"]
  spec.email       = ["orest.kostiuk@bitbrothers.dev"]
  spec.homepage    = "https://github.com/BitBrothersDev/RainbowVital"
  spec.summary     = "Summary of RainbowVital."
  spec.description = "Description of RainbowVital."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "https://github.com/BitBrothersDev/RainbowVital"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/BitBrothersDev/RainbowVital"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.5"
end

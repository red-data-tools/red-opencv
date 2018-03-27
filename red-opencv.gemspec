# -*- ruby -*-

clean_white_space = lambda do |entry|
  entry.gsub(/(\A\n+|\n+\z)/, '') + "\n"
end

$LOAD_PATH.unshift(File.join(__dir__, "lib"))
require "opencv/version"

Gem::Specification.new do |spec|
  spec.name = "red-opencv"
  spec.version = CV::VERSION
  spec.homepage = "https://github.com/red-data-tools/red-opencv"
  spec.authors = ["Kouhei Sutou"]
  spec.email = ["kou@clear-code.com"]

  readme = File.read("README.md")
  readme.force_encoding("UTF-8")
  entries = readme.split(/^\#\#\s(.*)$/)
  clean_white_space.call(entries[entries.index("Description") + 1])
  description = clean_white_space.call(entries[entries.index("Description") + 1])
  spec.summary, spec.description, = description.split(/\n\n+/, 3)
  spec.license = "BSD-3-Clause"
  spec.files = ["README.md", "LICENSE", "Rakefile", "Gemfile"]
  spec.files += ["#{spec.name}.gemspec"]
  spec.files += [".yardopts"]
  spec.files += Dir.glob("lib/**/*.rb")
  spec.files += Dir.glob("doc/text/*")
  spec.test_files += Dir.glob("test/**/*")
  spec.extensions = ["dependency-check/Rakefile"]

  spec.add_runtime_dependency("gobject-introspection")

  spec.add_development_dependency("bundler")
  spec.add_development_dependency("rake")
  spec.add_development_dependency("test-unit")
  spec.add_development_dependency("packnga")
  spec.add_development_dependency("kramdown")
end

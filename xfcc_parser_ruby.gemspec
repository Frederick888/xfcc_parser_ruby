# frozen_string_literal: true

require_relative "lib/xfcc_parser_ruby/version"

Gem::Specification.new do |spec|
  binary_gem = !ENV["XFCC_PARSER_RUBY_BINARY_GEM"].nil?

  spec.name = "xfcc_parser_ruby"
  spec.version = XfccParserRuby::VERSION
  spec.authors = ["Frederick Zhang"]
  spec.email = ["frederick888@tsundere.moe"]
  spec.license = "BSD-3-Clause"

  spec.summary = "Envoy x-forwarded-client-cert (XFCC) parser"
  spec.description = "Envoy x-forwarded-client-cert (XFCC) parser written in Rust for Ruby"
  spec.homepage = "https://github.com/Frederick888/xfcc_parser_ruby/"
  spec.required_ruby_version = [">= 2.6.0", "< 3.2.0"]
  spec.required_rubygems_version = ">= 3.3.11"
  spec.platform = Gem::Platform.local if binary_gem

  # spec.metadata['allowed_push_host'] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/Frederick888/xfcc_parser_ruby/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.files += Dir["lib/*/xfcc_parser_ruby.#{RbConfig::CONFIG["DLEXT"]}"] if binary_gem
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions = ["Cargo.toml"] unless binary_gem

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "rutie", "~> 0.0.3"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rake-compiler", "~> 1.2.1"
  spec.add_development_dependency "rb_sys"
  spec.add_development_dependency "rubocop", "~> 1.21"
  spec.add_development_dependency "rufo"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end

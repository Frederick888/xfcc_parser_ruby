# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/extensiontask"
require "rake/testtask"

task build: :compile

GEMSPEC = Gem::Specification.load("xfcc_parser_ruby.gemspec")
RUBY_MINOR_VERSION = RUBY_VERSION.split(".")[0..1].join(".")

Rake::ExtensionTask.new("xfcc_parser_ruby", GEMSPEC) do |ext|
  ext.lib_dir = "lib/#{RUBY_MINOR_VERSION}"
  ext.ext_dir = "."
end

desc "Compile with debug symbols"
task "compile:debug" do
  ENV["RB_SYS_CARGO_PROFILE"] = "dev"
  Rake::Task["compile"].invoke
end

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/test_*.rb"]
end

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[build test rubocop]

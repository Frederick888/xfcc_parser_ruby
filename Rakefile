# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/extensiontask"
require "rake/testtask"

task build: :compile

GEMSPEC = Gem::Specification.load("xfcc_parser_ruby.gemspec")

Rake::ExtensionTask.new("xfcc_parser_ruby", GEMSPEC) do |ext|
  ext.lib_dir = "lib"
  ext.ext_dir = "."
end

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/test_*.rb"]
end

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[build test rubocop]

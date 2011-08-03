# encoding: utf-8

require 'rubygems'
require 'bundler'
require 'rspec'
require 'rspec/core/rake_task'
require 'rake'
require 'jeweler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

Jeweler::Tasks.new do |gem|
  gem.name = "colour"
  gem.homepage = "http://github.com/wdevauld/colour"
  gem.license = "MIT"
  gem.summary = %Q{Colour manipulation library supporting RGB and HSV representations}
  gem.description = %Q{Support for computation of colour swatches in both the RGB and HSV colour representations}
  gem.email = "wes@devauld.ca"
  gem.authors = ["Wes Devauld"]
end
Jeweler::RubygemsDotOrgTasks.new

desc "Run all specs"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.verbose = false
end 

desc "Run all specs with rcov"
RSpec::Core::RakeTask.new(:coverage) do |t|
  t.rcov = true
  t.rcov_opts = %w{--exclude gems\/,spec\/} 
  t.verbose = true
end
task :default => :spec

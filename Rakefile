$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'bundler/setup'
require 'rake/testtask'
require "rdoc/task"

require "chinese_pinyin/version"

task :build do
  system "gem build chinese_pinyin.gemspec"
end

task :install => :build do
  system "sudo gem install chinese_pinyin-#{ChinesePinyin::VERSION}.gem"
end

task :release => :build do
  puts "Tagging #{ChinesePinyin::VERSION}..."
  system "git tag -a #{ChinesePinyin::VERSION} -m 'Tagging #{ChinesePinyin::VERSION}'"
  puts "Pushing to Github..."
  system "git push --tags"
  puts "Pushing to rubygems.org..."
  system "gem push chinese_pinyin-#{ChinesePinyin::VERSION}.gem"
end

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the chinese_pinyin plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the chinese_pinyin plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ChinesePinyin'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

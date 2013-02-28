require 'rake'
require 'rake/testtask'
require 'rdoc/task'
require 'rubygems'
require 'jeweler'

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

Jeweler::Tasks.new do |gemspec|
  gemspec.name = 'chinese_pinyin'
  gemspec.summary = 'translate chinese hanzi to pinyin.'
  gemspec.description = 'translate chinese hanzi to pinyin.'
  gemspec.email = 'flyerhzm@gmail.com'
  gemspec.homepage = 'http://github.com/flyerhzm/chinese_pinyin'
  gemspec.authors = ['Richard Huang']
  gemspec.files.exclude '.gitignore'
end
Jeweler::GemcutterTasks.new

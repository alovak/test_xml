require 'bundler'
Bundler::GemHelper.install_tasks
Bundler.setup

require 'rake/testtask'
require 'rspec/core/rake_task'
require 'rdoc/task'

task :default => ['test:units', :spec]

namespace :test do
  Rake::TestTask.new(:units) do |t|
    t.test_files = FileList['test/**/test_*.rb']
    t.libs << "test"
    t.verbose = true
  end
end


RSpec::Core::RakeTask.new do |t|
    #t.libs << "spec"
    t.verbose = true
end

RDoc::Task.new do |rd|
  rd.main = "README.rdoc"
  rd.rdoc_files.include("README.rdoc", "lib/**/*.rb")
end

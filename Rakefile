require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'spec/rake/spectask'
require 'rdoc/task'

task :default => ['test:units', :spec]

namespace :test do
  Rake::TestTask.new(:units) do |t|
    t.test_files = FileList['test/**/test_*.rb']
    t.libs << "test"
    t.verbose = true
  end
end


Spec::Rake::SpecTask.new do |t|
    t.libs << "spec"
    t.verbose = true
end

RDoc::Task.new do |rd|
  rd.main = "README.rdoc"
  rd.rdoc_files.include("README.rdoc", "lib/**/*.rb")
end

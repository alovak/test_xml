require 'rubygems'
require 'rake'
require 'rake/testtask'

task :default => 'test:units'

namespace :test do
  Rake::TestTask.new(:units) do |t|
    t.test_files = FileList['test/**/test_*.rb']
    t.libs << "test"
    t.verbose = true
  end
end

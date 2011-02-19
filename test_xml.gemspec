lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'test_xml/version'

Gem::Specification.new do |s|
  s.name		= "test_xml"
  s.version		= TestXml::VERSION
  s.author		= "Pavel Gabriel"
  s.homepage		= "http://github.com/alovak/test_xml"
  s.summary		= "test_xml allows you to test xml with RSpec, Test::Unit, Cucumber"
  s.description		= "test_xml allows you to test xml (match stucture and values) with RSpec, Test::Unit, Cucumber"
  s.email		= "alovak@gmail.com"
  s.require_path	= "lib"
  s.has_rdoc		= true
  s.extra_rdoc_files = ['README.rdoc']
  s.rdoc_options	= ['--main', 'README.rdoc']
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  
  s.rubygems_version	= "1.3.5"
  s.add_dependency("nokogiri",       [">= 1.3.2"])
  
  s.add_development_dependency("rake")
  s.add_development_dependency("rdoc")
  s.add_development_dependency("rspec-core")
end

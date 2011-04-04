lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'test_xml/version'

Gem::Specification.new do |s|
  s.name		      = "test_xml"
  s.version		    = TestXml::VERSION
  s.authors		    = ["Pavel Gabriel", "Nick Sutterer"]
  s.homepage		  = "http://github.com/alovak/test_xml"
  s.summary		    = "Test your XML with Test::Unit, MiniTest, RSpec, or Cucumber."
  s.description		= "Test your XML with Test::Unit, MiniTest, RSpec, or Cucumber using handy assertions like #assert_xml_equal or #assert_xml_structure_contain."
  s.email		      = ["alovak@gmail.com", "apotonick@gmail.com"]
  s.require_path	= "lib"
  s.has_rdoc		  = true
  s.extra_rdoc_files = ['README.rdoc']
  s.rdoc_options	= ['--main', 'README.rdoc']
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  
  s.rubygems_version	= "1.3.5"
  s.add_dependency("nokogiri",       [">= 1.3.2"])
  
  s.add_development_dependency("rake")
  s.add_development_dependency("rdoc")
  s.add_development_dependency("rspec-core", ["~> 2.2"])
end

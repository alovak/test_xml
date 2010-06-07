require 'lib/test_xml/version'

Gem::Specification.new do |s|
  s.name         = "test_xml"
  s.version      = TestXml::VERSION
  s.author       = "Pavel Gabriel"
  s.homepage     = "http://github.com/alovak/test_xml"
  s.summary      = "test_xml allows you to test xml with RSpec, Test::Unit, Cucumber"
  s.description  = "test_xml allows you to test xml (match stucture and values) with RSpec, Test::Unit, Cucumber"
  s.email        = "alovak@gmail.com"
  s.require_path = "lib"
  s.files        = Dir.glob("lib/**/*.rb") +
                   Dir.glob("test/**/*.rb") +
                   Dir.glob("spec/**/*.rb") +
                   %w(Rakefile)
  s.rubygems_version = "1.3.5"
  s.add_dependency("nokogiri",       [">= 1.3.2"])
end

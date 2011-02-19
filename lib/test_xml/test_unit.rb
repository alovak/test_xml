require "test/unit"
require "test_xml"
require 'test_xml/test_unit/assertions'

class Test::Unit::TestCase
  include TestXml::TestUnit::Assertions
end

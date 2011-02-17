require "test_xml"
require 'test_xml/test_unit/assertions'

class MiniTest::Unit::TestCase
  include TestXml::TestUnit::Assertions
end

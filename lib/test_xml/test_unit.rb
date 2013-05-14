require "test/unit"
require "test_xml"

class Test::Unit::TestCase
  include TestXml::Assertions
end
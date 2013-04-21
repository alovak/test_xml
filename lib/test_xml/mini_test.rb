require "test_xml"
require 'test_xml/test_unit/assertions'

class MiniTest::Unit::TestCase
  include TestXml::TestUnit::Assertions
  MiniTest::Expectations.class_eval do
    { :assert_xml_contain           => :must_contain_xml,
      :assert_xml_structure_contain => :must_contain_xml_structure,
      :assert_xml_equal             => :must_equal_xml,
      :assert_xml_equal_structure   => :must_equal_xml_structure
    }.each_pair do |assertion, matcher|
      infect_an_assertion assertion, matcher
    end
  end
end

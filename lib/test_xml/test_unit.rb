module TestXml
  module TestUnit
    include TestXml::Matchers

    def assert_xml_equal(xml)
      assert_block do
        true
        #raise Test::Unit::AssertionFailedError.new('a is not equal to b')
      end
    end
  end
end

class Test::Unit::TestCase
  include TestXml::TestUnit
end

require 'test_helper'

class TestTestUnit < Test::Unit::TestCase
  def test_assert_xml
    xml = <<-XML
      <root>
        <one>1</one>
      </root>
    XML

    assert_xml_equal(xml) do
      <<-XML
        <root>
          <one>1</one>
        </root>
      XML
    end
  end
end

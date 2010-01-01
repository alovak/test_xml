require 'test_helper'

class TestTestUnit < Test::Unit::TestCase
  def test_assert_match_xml
    xml = <<-XML
      <root>
        <one>1</one>
      </root>
    XML

    assert_match_xml(xml) do
      <<-XML
        <root>
          <one>1</one>
        </root>
      XML
    end
  end

  def test_assert_match_xml_structure
    xml = <<-XML
      <root>
        <one>1</one>
        <two>
          <three>3</three>
        </two>
      </root>
    XML

    assert_match_xml_structure(xml) do
      <<-XML
        <root>
          <one>2</one>
          <two><three/></two>
        </root>
      XML
    end
  end

  def test_assert_not_match_xml
    xml = <<-XML
      <root>
        <one>1</one>
      </root>
    XML

    assert_not_match_xml(xml) do
      <<-XML
        <root>
          <one>2</one>
        </root>
      XML
    end
  end
end

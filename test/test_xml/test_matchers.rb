require 'test_helper'

class TestMatchers < Test::Unit::TestCase
  include TestXml::Matchers

  def test_find_elements_in_xml
    actual = <<-XML
      <root>
        <one>
          <two>2</two>
        </one>
      </root>
    XML

    assert match_xml?(actual, '<root/>')
    assert match_xml?(actual, '<root><one/></root>')
    assert match_xml?(actual, '<root><one><two/></one></root>')
  end

  def test_not_find_elements_in_xml
    actual = <<-XML
      <root>
        <one>1</one>
      </root>
    XML

    assert !match_xml?(actual, '<one/>')
    assert !match_xml?(actual, '<root><two/></root>')
  end

  def test_match_xml_with_different_elements_order
    actual = <<-XML
      <root>
        <one>1</one>
        <two>2</two>
        <three>3</three>
        <four>
          <five>5</five>
        </four>
      </root>
    XML

    expected = <<-XML
      <root>
        <two>2</two>
        <one>1</one>
      </root>
    XML

    assert match_xml?(actual, expected)
  end
end

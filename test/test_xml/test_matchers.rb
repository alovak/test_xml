require 'test_helper'

class TestMatchers < Test::Unit::TestCase
  include TestXml::Matchers

  def test_match
    actual = <<-XML
      <root>
        <one>
          <two>2</two>
        </one>
      </root>
    XML

    assert  match_xml?(actual, '<root><one><two/></one></root>')
    assert !match_xml?(actual, '<root><two/></root>')
  end

  def test_match_with_values
    actual = <<-XML
      <root>
        <one>1</one>
        <two>2</two>
      </root>
    XML

    assert  match_xml?(actual, '<root><one>1</one></root>', true)
    assert !match_xml?(actual, '<root><one>2</one></root>', true)
  end
end

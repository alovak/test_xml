require 'test_helper'

class TestAssertions < Test::Unit::TestCase
  def test_assert_match_xml_fails_if_actual_is_not_contained_in_expected
    e = assert_raises AssertionError do
      assert_xml_contain("<root><one>1</one><one>2</one></root>", "<root><one>3</one></root>")
    end
    
    assert_match %r{the xml:\n<root><one>1</one><one>2</one></root>\nshould contain xml:\n<root><one>3</one></root>}, e.message
  end
    
  def test_assert_xml_contain
    expected = <<-XML
      <root>
        <one>1</one>
        <two>2</two>
      </root>
    XML
    
    actual = <<-XML
      <root>
        <one>1</one>
      </root>
    XML
    
    assert_xml_contain expected, actual
  end

  def test_assert_not_xml_contain
    expected = <<-XML
      <root>
        <one>1</one>
      </root>
    XML
    
    actual = <<-XML
      <root>
        <one>2</one>
      </root>
    XML
    
    assert_not_xml_contain expected, actual
  end

  def test_assert_xml_structure_contain
    expected = <<-XML
      <root>
        <one>1</one>
        <two>
          <three>3</three>
        </two>
      </root>
    XML
    
    actual = <<-XML
      <root>
        <one>2</one>
        <two>
          <three>4</three>
        </two>
      </root>
    XML
    
    assert_xml_structure_contain expected, actual
  end

  def test_assert_not_xml_structure_contain
    expected = <<-XML
      <root>
        <one>1</one>
        <two>
          <three>3</three>
        </two>
      </root>
    XML
    
    actual = <<-XML
      <root>
        <one>2</one>
        <two>
          <four/>
        </two>
      </root>
    XML
    
    assert_not_xml_structure_contain expected, actual
  end

  def test_assert_xml_equal
    expected = <<-XML
      <root>
        <one>1</one>
        <two>2</two>
      </root>
    XML
    
    actual = <<-XML
      <root>
        <one>1</one>
        <two>2</two>
      </root>
    XML
    
    assert_xml_equal expected, actual
  end

  def test_assert_not_xml_equal
    expected = <<-XML
      <root>
        <one>1</one>
        <two>2</two>
      </root>
    XML
    
    actual = <<-XML
      <root>
        <one>1</one>
      </root>
    XML
    
    assert_not_xml_equal expected, actual
  end
  
  def test_assert_xml_structure_equal
    expected = <<-XML
      <root>
        <one>1</one>
        <two>
          <three>3</three>
        </two>
      </root>
    XML
    
    actual = <<-XML
      <root>
        <one>2</one>
        <two>
          <three>4</three>
        </two>
      </root>
    XML
    
    assert_xml_structure_equal expected, actual
  end

  def test_assert_not_xml_structure_equal
    expected = <<-XML
      <root>
        <one>1</one>
        <two>
          <three>3</three>
        </two>
      </root>
    XML
    
    actual = <<-XML
      <root>
        <one>2</one>
        <two>
          <three>3</three>
          <four/>
        </two>
      </root>
    XML
    
    assert_not_xml_structure_equal expected, actual
  end
end

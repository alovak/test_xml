require 'test_helper'

class TestAssertions < Test::Unit::TestCase
  def test_assert_match_xml_fails_if_actual_is_not_contained_in_expected
    e = assert_raises Test::Unit::AssertionFailedError do
      assert_match_xml("<root><one>1</one><one>2</one></root>", "<root><one>3</one></root>")
    end
    
    assert_equal "the xml:\n<root><one>1</one><one>2</one></root>\nshould match xml:\n<root><one>3</one></root>", e.message
  end
    
  def test_assert_match_xml
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

    assert_match_xml(expected) do
      actual
    end
    
    assert_match_xml expected, actual
  end

  def test_assert_not_match_xml
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
      
    assert_not_match_xml(expected) do
      actual
    end
    
    assert_not_match_xml expected, actual
  end

  def test_assert_match_xml_structure
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

    assert_match_xml_structure(expected) do
      actual
    end
    
    assert_match_xml_structure expected, actual
  end

  def test_assert_not_match_xml_structure
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
    
    assert_not_match_xml_structure(expected) do
      actual
    end
    
    assert_not_match_xml_structure expected, actual
  end

  def test_assert_exactly_match_xml
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

    assert_exactly_match_xml(expected) do
      actual
    end
    
    assert_exactly_match_xml expected, actual
  end

  def test_assert_not_exactly_match_xml
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

    assert_not_exactly_match_xml(expected) do
      actual
    end
    
    assert_not_exactly_match_xml expected, actual
  end
  
  def test_assert_exactly_match_xml_structure
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
    
    assert_exactly_match_xml_structure(expected) do
      actual
    end
    
    assert_exactly_match_xml_structure expected, actual
  end

  def test_assert_not_exactly_match_xml_structure
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

    assert_not_match_xml_structure(expected) do
      actual
    end
    
    assert_not_match_xml_structure expected, actual
  end
end

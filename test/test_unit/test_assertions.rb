require 'test_helper'

class TestAssertions < Test::Unit::TestCase
  def test_assert_xml_contain
    expected = <<-XML
      <root>
        <one id="first">1</one>
        <two>2</two>
      </root>
    XML
    
    actual = <<-XML
      <root>
        <one id="first">1</one>
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
  
  def test_assert_xml_equal_with_attributes
    expected = <<-XML
      <root>
        <one b="second" a="first">1</one>
        <two b="second" a="first" />
      </root>
    XML
    
    actual = <<-XML
      <root>
        <one a="first" b="second">1</one>
        <two b="second" a="first" />
      </root>
    XML
    
    assert_xml_equal expected, actual
  end
  
  def test_assert_not_xml_equal_with_attributes
    expected = <<-XML
      <root>
        <one b="second" a="first">1</one>
      </root>
    XML
    
    actual = <<-XML
      <root>
        <one a="whoops, wrong" b="second">1</one>
      </root>
    XML
    
    assert_not_xml_equal expected, actual
  end
  
  def test_assert_not_xml_equal_with_attributes_and_no_text
    expected = <<-XML
      <root>
        <one b="second" a="first" />
      </root>
    XML
    
    actual = <<-XML
      <root>
        <one a="whoops, wrong" b="second" />
      </root>
    XML
    
    assert_not_xml_equal expected, actual
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

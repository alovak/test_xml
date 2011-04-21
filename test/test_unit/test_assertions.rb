require 'test_helper'

class TestAssertions < Test::Unit::TestCase
  def test_assert_xml_contain_message_if_fails
    begin 
      assert_xml_contain("<root><one>1</one><one>2</one></root>", "<root><one>3</one></root>")
    rescue Exception => e
      assert_match %r{the xml:\n<root><one>1</one><one>2</one></root>\nshould contain xml:\n<root><one>3</one></root>}, e.message
    end
  end

  def test_assert_xml_not_contain_message_if_fails
    begin 
      assert_not_xml_contain("<root><one>1</one><one>2</one></root>", "<root><one>1</one><one>2</one></root>")
    rescue Exception => e
      assert_match %r{the xml:\n<root><one>1</one><one>2</one></root>\nshould not contain xml:\n<root><one>1</one><one>2</one></root> but it does}, 
                   e.message
    end
  end
    
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

  def test_assert_xml_equal_with_attributes_in_branch_element
    expected = <<-XML
      <root type="test">
        <one>1</one>
        <two/>
      </root>
    XML
    
    actual = <<-XML
      <root type="test">
        <one>1</one>
        <two/>
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

  def test_assert_not_xml_equal_with_attributes_in_branch_element
    expected = <<-XML
      <root type="test">
        <one>1</one>
        <two/>
      </root>
    XML
    
    actual = <<-XML
      <root>
        <one>1</one>
        <two/>
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

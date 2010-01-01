require 'test_helper'

class TestNode < Test::Unit::TestCase
  def test_elements
    assert doc.elements.size == 1
    assert doc.at('root').elements.size == 2
  end

  def test_text_element
    assert doc(<<-XML).at('root').text_element?
      <root>
        hello
      </root>
    XML
  end

  def test_match_of_elements_without_comparing_values
    subject = doc(<<-XML)
      <root>
        <one>1</one>
        <two>
          <three>3</three>
        </two>
      </root>
    XML

    pattern = doc(<<-XML)
      <root>
        <two><three/></two>
        <one>2</one>
      </root>
    XML

    assert subject.match?(pattern)
  end

  def test_no_match_of_elements_without_comparing_values
    subject = doc(<<-XML)
      <root>
        <one>1</one>
        <two/>
      </root>
    XML

    pattern = doc(<<-XML)
      <root>
        <four/>
        <five>5</five>
      </root>
    XML

    assert !subject.match?(pattern)
  end

  def test_match_with_values
    subject = doc(<<-XML)
      <root>
        <one>1</one>
        <two><three>3</three></two>
      </root>
    XML

    pattern = doc(<<-XML)
      <root>
        <two><three>3</three></two>
        <one>1</one>
      </root>
    XML

    assert subject.match?(pattern, true)
  end

  def test_no_match_with_values
    subject = doc(<<-XML)
      <root>
        <one>1</one>
      </root>
    XML

    not_matched_pattern = doc(<<-XML)
      <root>
        <one>2</one>
      </root>
    XML

    assert !subject.match?(not_matched_pattern, true)
  end

  def test_element_contains_another_element
    element = create_element('<one/>')

    assert !doc.send(:contains?,element)
    assert doc.at('root').send(:contains?,element)
  end
  
  def test_element_contains_elements
    assert doc.root.send(:contains_elements_of?, doc.root)
    assert !doc.root.send(:contains_elements_of?, doc('<root><test_element/></root>'))
  end

  private

  def create_element(xml)
    Nokogiri::XML::Document.parse(xml).root
  end

  def doc(xml = nil)
    xml ||= <<-XML
      <root>
        <one>1</one>
        <two>2</two>
      </root>
    XML
    Nokogiri::XML::Document.parse(xml)
  end
end

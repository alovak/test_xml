require 'test_helper'

class TestNode < Test::Unit::TestCase
  def test_elements
    assert doc.elements.size == 1
    assert doc.at('root').elements.size == 2
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

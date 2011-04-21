module TestXml
  # This module implements the actual matchers with their conditions.
  module MatcherMethods
    def self.xml_contain(subject, pattern)
      actual, expected = parse_xml(subject, pattern)
      actual.match?(expected, true)
    end
    
    def self.xml_equal(subject, pattern)
      actual, expected = parse_xml(subject, pattern)
      actual.match?(expected, true) && expected.match?(actual, true)
    end
    
    def self.xml_structure_contain(subject, pattern)
      actual, expected = parse_xml(subject, pattern)
      actual.match?(expected)
    end
    
    def self.xml_structure_equal(subject, pattern)
      actual, expected = parse_xml(subject, pattern)
      actual.match?(expected) && expected.match?(actual)
    end
    
  private
    def self.parse_xml(subject, pattern)
      [Nokogiri::XML.parse(subject).root, Nokogiri::XML.parse(pattern).root]
    end
  end
end

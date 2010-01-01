module TestXml
  module Matchers
    class XmlMatcher
      attr_reader :subject, :pattern, :compare_value
      def initialize(subject, pattern, compare_value)
        @subject = Nokogiri::XML::Document.parse(subject)
        @pattern = Nokogiri::XML::Document.parse(pattern)
        @compare_value = compare_value
      end

      def match?
        subject.match?(pattern, compare_value)
      end
    end

    def match_xml?(subject, pattern, compare_value = false)
      matcher = XmlMatcher.new(subject, pattern, compare_value)
      matcher.match?
    end
  end
end

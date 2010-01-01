module TestXml
  module Matchers
    class XmlMatcher
      attr_reader :subject, :pattern, :options
      def initialize(subject, pattern)
        @subject = Nokogiri::XML::Document.parse(subject)
        @pattern = Nokogiri::XML::Document.parse(pattern)
      end

      def match?
        subject.match?(pattern)
      end
    end

    def match_xml?(subject, pattern)
      XmlMatcher.new(subject, pattern).match?
    end
  end
end

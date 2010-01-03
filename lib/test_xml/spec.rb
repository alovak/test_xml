module TestXml
  module Spec
    class MatchXml
      include TestXml::Matchers

      def initialize(expected, compare_values = false)
        @expected = expected
        @compare_values = compare_values
      end

      def matches?(actual)
        @actual = actual
        match_xml?(@actual, @expected, @compare_values)
      end

      def failure_message_for_should
        "expected\n#{@actual} to match#{structure_message}\n#{@expected}"
      end

      def failure_message_for_should_not
        "expected\n#{@actual} not to match#{structure_message}\n#{@expected}"
      end

      private
      def structure_message
        " structure" unless @compare_values
      end
    end

    def match_xml(expected)
      MatchXml.new(expected, true)
    end

    def match_xml_structure(expected)
      MatchXml.new(expected, false)
    end
  end
end

class Spec::Example::ExampleGroup
  include TestXml::Spec
end

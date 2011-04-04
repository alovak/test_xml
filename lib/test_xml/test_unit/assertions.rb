require 'test_xml/matcher_methods'

module TestXml
  module TestUnit
    module Assertions
      def self.assertions_for(name, options)
        define_method("assert_#{name}") do |subject, pattern|
          full_message = options[:message_for_should].gsub(/\<pattern\>/, pattern).gsub(/\<subject\>/, subject)

          assert_block(full_message) do
            MatcherMethods.send(name, subject, pattern)
          end
        end

        define_method("assert_not_#{name}") do |subject, pattern|
          full_message = options[:message_for_should_not].gsub(/\<pattern\>/, pattern).gsub(/\<subject\>/, subject)

          assert_block(full_message) do
            not MatcherMethods.send(name, subject, pattern)
          end
        end
      end
      
      
      assertions_for :xml_contain,
                     :message_for_should     => "the xml:\n<subject>\nshould contain xml:\n<pattern>",
                     :message_for_should_not => "the xml:\n<subject>\nshould not contain xml:\n<pattern> but it does"

      assertions_for :xml_equal,
                     :message_for_should     => "the xml:\n<subject>\nshould exactly match xml:\n<pattern>",
                     :message_for_should_not => "the xml:\n<subject>\nshould not exactly match xml:\n<pattern> but it does"

      assertions_for :xml_structure_contain,
                     :message_for_should     => "the xml:\n<subject>\nshould match xml structure:\n<pattern>",
                     :message_for_should_not => "the xml:\n<subject>\nshould not match xml structure:\n<pattern> but it does"

      assertions_for :xml_structure_equal,
                     :message_for_should     => "the xml:\n<subject>\nshould exactly match xml structure:\n<pattern>",
                     :message_for_should_not => "the xml:\n<subject>\nshould not exactly match xml structure:\n<pattern> but it does"
    end
  end
end

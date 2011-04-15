require 'test_xml/matcher_methods'

module TestXml
  module TestUnit
    module Assertions

      def self.assertions_for(name, options)
        define_method("assert_#{name}") do |subject, pattern|
          full_message = options[:message_for_should].gsub(/\<pattern\>/, pattern).gsub(/\<subject\>/, subject)

          correct_assert(MatcherMethods.send(name, subject, pattern), full_message)
        end

        define_method("assert_not_#{name}") do |subject, pattern|
          full_message = options[:message_for_should_not].gsub(/\<pattern\>/, pattern).gsub(/\<subject\>/, subject)

          correct_assert(!MatcherMethods.send(name, subject, pattern), full_message)
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

      private
      def correct_assert(boolean, message)
        if RUBY_VERSION =~ /1.9.2/ or defined?(MiniTest)
          assert(boolean, message)
        else
          assert_block(message) do
            boolean
          end
        end
      end
    end
  end
end

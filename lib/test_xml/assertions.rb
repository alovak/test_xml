require 'ostruct'

module TestXml
  class AssertionConfig < OpenStruct
    def assert_name
      "assert_#{name}"
    end

    def assert_not_name
      "assert_not_#{name}"
    end

    def expectation
      "must_#{matcher}"
    end
  end

  ASSERTIONS = [
    AssertionConfig.new(
      :name       => :xml_contain,
      :matcher    => :contain_xml,
      :message    => lambda { |a,b| "the xml:\n#{a}\nshould contain xml:\n#{b}" },
      :message_when_negated => lambda { |a,b| "the xml:\n#{a}\nshould not contain xml:\n#{b} but it does" }
    ),
    AssertionConfig.new(
      :name       => :xml_structure_contain,
      :matcher    => :contain_xml_structure,
      :message    => lambda { |a,b| "the xml:\n#{a}\nshould match xml structure:\n#{b}" },
      :message_when_negated => lambda { |a,b| "the xml:\n#{a}\nshould not match xml structure:\n#{b} but it does" }
    ),
    AssertionConfig.new(
      :name       => :xml_equal,
      :matcher    => :equal_xml,
      :message    => lambda { |a,b| "the xml:\n#{a}\nshould exactly match xml:\n#{b}" },
      :message_when_negated => lambda { |a,b| "the xml:\n#{a}\nshould not exactly match xml:\n#{b} but it does" }
    ),
    AssertionConfig.new(
      :name       => :xml_structure_equal,
      :matcher    => :equal_xml_structure,
      :message    => lambda { |a,b| "the xml:\n#{a}\nshould exactly match xml structure:\n#{b}" },
      :message_when_negated => lambda { |a,b| "the xml:\n#{a}\nshould not exactly match xml structure:\n#{b} but it does" }
    )
  ]

  module Assertions
    ASSERTIONS.each do |cfg|
      define_method(cfg.assert_name) do |a, b|
        correct_assert(MatcherMethods.send(cfg.name, a, b), cfg.message.call(a, b))
      end

      define_method(cfg.assert_not_name) do |a, b|
        correct_assert(! MatcherMethods.send(cfg.name, a, b), cfg.message_when_negated.call(a, b))
      end
    end

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
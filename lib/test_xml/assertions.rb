require 'ostruct'
require 'diffy'

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
      :message    => lambda { |expect, actual| "the xml:\n#{actual}\nshould contain xml:\n#{expect}" },
      :message_when_negated => lambda { |expect, actual| "the xml:\n#{actual}\nshould not contain xml:\n#{expect} but it does" }
    ),
    AssertionConfig.new(
      :name       => :xml_structure_contain,
      :matcher    => :contain_xml_structure,
      :message    => lambda { |expect, actual| "the xml:\n#{actual}\nshould match xml structure:\n#{expect}" },
      :message_when_negated => lambda { |expect, actual| "the xml:\n#{actual}\nshould not match xml structure:\n#{expect} but it does" }
    ),
    AssertionConfig.new(
      :name       => :xml_equal,
      :matcher    => :equal_xml,
      :message    => lambda { |expect, actual| sprintf "the xml:\n%s\nshould exactly match xml:\n%s\n\nDiff:\n%s", actual, expect, diff(expect, actual) },
      :message_when_negated => lambda { |expect, actual| "the xml:\n#{actual}\nshould not exactly match xml:\n#{expect} but it does" }
    ),
    AssertionConfig.new(
      :name       => :xml_structure_equal,
      :matcher    => :equal_xml_structure,
      :message    => lambda { |expect, actual| "the xml:\n#{actual}\nshould exactly match xml structure:\n#{expect}" },
      :message_when_negated => lambda { |expect, actual| "the xml:\n#{actual}\nshould not exactly match xml structure:\n#{expect} but it does" }
    )
  ]

  def self.diff(expect, actual)
    doc_actual = Nokogiri::XML.parse(actual, &:noblanks)
    doc_expect = Nokogiri::XML.parse(expect, &:noblanks)

    diff = Diffy::Diff.new(doc_expect.to_xml, doc_actual.to_xml, :context => 3, :include_diff_info => true).to_a
    return "" if diff.empty?

    # Skip diff headers, they're useless since they refer to tempfiles
    diff[2..-1].join("")
  end

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

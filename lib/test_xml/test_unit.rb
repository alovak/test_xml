module TestXml
  module TestUnit
    include TestXml::Matchers

    def assert_match_xml(xml, message = "")
      pattern = yield
      full_message = build_message(message, <<-EOT, xml, pattern)
        The following xml:
        ?
        does not match with:
        ?
      EOT
      assert_block(full_message) do
        match_xml?(xml, yield, true)
      end
    end

    def assert_match_xml_structure(xml, message = "")
      pattern = yield
      full_message = build_message(message, <<-EOT, xml, pattern)
        The following xml:
        ?
        does not match with structure of:
        ?
      EOT
      assert_block(full_message) do
        match_xml?(xml, yield)
      end
    end

    def assert_not_match_xml(xml, message = "")
      pattern = yield
      full_message = build_message(message, <<-EOT, xml, pattern)
        The following xml:
        ?
        matches with:
        ?
      EOT
      assert_block(full_message) do
        !match_xml?(xml, yield, true)
      end
    end
  end
end

class Test::Unit::TestCase
  include TestXml::TestUnit
end
